"""
国际化支持 — 按语言分文件夹。

目录结构：
    ui/i18n/
        __init__.py   ← 本文件（加载器 + 对外 API）
        zh/*.py       ← 每个文件是一个 feature 的翻译，含 STRINGS dict
        en/*.py
        <lang>/*.py   ← 加新语言 = 新建文件夹

加新语言：复制 en/ → <lang>/，翻译每个文件里的 STRINGS value，重启软件即生效。
缺失的 key 自动 fallback 到 en → zh → key 本身，不会崩。
"""
from __future__ import annotations

import importlib
import logging
from pathlib import Path

logger = logging.getLogger(__name__)

# 语言 -> {key: text}
_languages: dict[str, dict[str, str]] = {}
_current_lang: str = "zh"
_FALLBACK_CHAIN = ("en", "zh")
_PKG_ROOT = Path(__file__).parent


def _load_language_dir(lang: str) -> dict[str, str]:
    """加载 ui/i18n/<lang>/*.py，合并所有 STRINGS。"""
    lang_dir = _PKG_ROOT / lang
    if not lang_dir.is_dir():
        return {}
    merged: dict[str, str] = {}
    for py_file in sorted(lang_dir.glob("*.py")):
        if py_file.stem == "__init__":
            continue
        module_name = f"ui.i18n.{lang}.{py_file.stem}"
        try:
            mod = importlib.import_module(module_name)
        except Exception as exc:
            logger.exception("加载翻译文件失败: %s (%s)", module_name, exc)
            continue
        strings = getattr(mod, "STRINGS", None)
        if not isinstance(strings, dict):
            logger.warning("%s 缺少 STRINGS dict，跳过", module_name)
            continue
        overlap = merged.keys() & strings.keys()
        if overlap:
            raise ImportError(
                f"翻译 key 重复定义: {sorted(overlap)} 在 {lang}/{py_file.name}"
            )
        merged.update(strings)
    return merged


def _load_all_languages() -> None:
    """扫描所有语言文件夹并加载。"""
    for entry in sorted(_PKG_ROOT.iterdir()):
        if not entry.is_dir():
            continue
        name = entry.name
        if name.startswith("_") or name.startswith("."):
            continue
        loaded = _load_language_dir(name)
        if loaded:
            _languages[name] = loaded


def _load_saved_language() -> str:
    try:
        from PyQt5.QtCore import QSettings

        s = QSettings("HOI4MapMaker", "Settings")
        return s.value("language", "zh")
    except Exception:
        return "zh"


# 启动时加载
_load_all_languages()
_current_lang = _load_saved_language()
if _current_lang not in _languages:
    _current_lang = "zh" if "zh" in _languages else next(iter(_languages), "zh")


# ---------- 对外 API ----------
# 语言 code -> 母语显示名（社区加新语言时扩展此表）
_DISPLAY_NAMES: dict[str, str] = {
    "zh": "中文",
    "en": "English",
    "ja": "日本語",
    "ko": "한국어",
    "ru": "Русский",
    "de": "Deutsch",
    "fr": "Français",
    "es": "Español",
    "pt": "Português",
    "it": "Italiano",
    "pl": "Polski",
}


def available_languages() -> list[str]:
    """列出所有已加载的语言 code（用于设置下拉菜单动态填充）。"""
    return sorted(_languages.keys())


def language_display_name(code: str) -> str:
    """返回语言 code 的母语显示名，未知则回退到 code 本身。"""
    return _DISPLAY_NAMES.get(code, code)


def set_language(lang: str) -> None:
    """切换语言并持久化到 QSettings。"""
    global _current_lang
    if lang not in _languages:
        logger.warning("语言 %s 未加载，忽略切换", lang)
        return
    _current_lang = lang
    try:
        from PyQt5.QtCore import QSettings

        s = QSettings("HOI4MapMaker", "Settings")
        s.setValue("language", lang)
    except Exception:
        pass


def get_language() -> str:
    """当前语言 code。"""
    return _current_lang


def tr(key: str, *args: object) -> str:
    """
    获取翻译文本，支持 str.format 参数。
    例：tr("status_pos", 100, 200) -> "位置: (100, 200)"

    缺失时按 _current_lang -> en -> zh -> key 顺序 fallback。
    """
    for lang in (_current_lang, *_FALLBACK_CHAIN):
        text = _languages.get(lang, {}).get(key)
        if text is not None:
            if args:
                try:
                    return text.format(*args)
                except (IndexError, KeyError):
                    return text
            return text
    return key


def reload_translations() -> None:
    """热重载：清空并重新扫描（用于开发调试）。"""
    _languages.clear()
    _load_all_languages()
