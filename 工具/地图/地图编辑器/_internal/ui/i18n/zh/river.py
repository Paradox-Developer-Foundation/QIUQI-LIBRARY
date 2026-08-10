"""
river — zh 翻译

本文件由 tools/migrate_i18n.py 生成。后续手动维护。
"""

STRINGS: dict[str, str] = {
    "dlg_river_validate_title": "河流验证",
    "river_auto_need_provinces": "请先生成省份再自动生成河流",
    "river_auto_tip": "根据高度图自动画河，不用手动。生成后可手动改/擦除。",
    "river_auto_tooltip": "基于高度图自动生成合理河流网络，几秒完成全图",
    "river_brush_btn": "画笔",
    "river_btn_auto": "自动生成河流",
    "river_btn_auto_new": "🌊 自动生成河流",
    "river_btn_auto_tip": "根据高度图自动生成河流网络（从山地汇流到海洋）",
    "river_btn_validate": "验证河流",
    "river_btn_validate_new": "✓ 验证河流是否合法",
    "river_eraser_btn": "橡皮",
    "river_eraser_range": "橡皮范围:",
    "river_hint": "河流规则: 必须1像素宽，只走上下左右(不能斜走)每条河需要1个源头(绿)。红=支流汇入 黄=分叉画笔大小仅影响橡皮擦范围，河流本身必须1像素宽",
    "river_label_size": "大小:",
    "river_marker_confluence": "汇入点",
    "river_marker_mouth": "入海口",
    "river_marker_source": "源头",
    "river_pan_btn": "平移",
    "river_section_auto": "🪄 一键生成河流（推荐）",
    "river_section_brush_size": "画笔大小",
    "river_section_manual": "✏️ 手动画河流（3 步）",
    "river_section_markers": "标记 (单像素)",
    "river_section_tools": "工具",
    "river_section_width": "宽度画笔",
    "river_step1_title": "<b>步骤 1：</b>选河流宽度",
    "river_step2_hint": """从山上某点按住鼠标 → 拖到海边 → 松手
⚠️ 只能走上下左右，不能斜线""",
    "river_step2_title": "<b>步骤 2：</b>在地图上画河",
    "river_step3_hint": """每条河至少 1 个源头（绿）
入海口（黄）放河流末端
汇入点（红）= 两条河合并处""",
    "river_step3_title": "<b>步骤 3：</b>加起点/终点标记",
    "river_tool_brush": "画笔",
    "river_tool_eraser": "橡皮",
    "river_tool_pan": "平移",
    "river_validate_tooltip": "检查是否有对角线像素、缺失源头等问题",
    "river_width_1": "细流",
    "river_width_2": "小河",
    "river_width_4": "中河",
    "river_width_5": "大河",
    "river_width_7": "宽河",
    "river_width_8": "巨河",
    "river_width_9": "最宽",
    "river_width_note": "💡 河流必须 1px 宽（HOI4 规则），滑块只影响橡皮擦范围",
}
