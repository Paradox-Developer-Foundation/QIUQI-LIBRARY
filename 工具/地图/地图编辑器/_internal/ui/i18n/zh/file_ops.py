"""
file_ops — zh 翻译

本文件由 tools/migrate_i18n.py 生成。后续手动维护。
"""

STRINGS: dict[str, str] = {
    "file_ops_export_fail": "导出失败",
    "file_ops_img_read_fail": "读取图片失败：{0}",
    "file_ops_import_confirm": "导入将替换当前地图数据，是否继续？",
    "file_ops_import_done": "导入完成",
    "file_ops_import_fail": "导入失败：{0}",
    "file_ops_import_warnings": """注意:
""",
    "file_ops_invert_prompt": "勾选 Yes 表示：暗色为陆地、亮色为海洋（默认 No）",
    "file_ops_invert_title": "反转?",
    "file_ops_landmask_done": "陆海导入完成 — 陆地 {0}% / 海洋 {1}%",
    "file_ops_landmask_title": "选择陆海源图",
    "file_ops_load_fail": "加载失败",
    "file_ops_loaded": "项目已加载: {0}",
    "file_ops_loaded_gaps": "项目已加载: {0} | ⚠ 项目自带 {1} 个省份 ID 空洞",
    "file_ops_map_size_prompt": "选择新项目的地图尺寸：",
    "file_ops_map_size_title": "选择地图尺寸",
    "file_ops_missing_files": """目录缺少必需文件:
""",
    "file_ops_mod_imported": "MOD地图已导入 ({0}×{1}, {2} 省份, {3} 州, {4} 战略区域, {5} 美术资产)",
    "file_ops_new_confirm": "新建项目将清除当前数据，是否继续？",
    "file_ops_new_created": "新项目已创建 ({0}×{1})",
    "file_ops_open_title": "打开项目",
    "file_ops_proj_filter": "HOI4 项目 (*.hoi4proj);;All Files (*)",
    "file_ops_ref_fail": "无法加载图片",
    "file_ops_ref_loaded": "参考图已加载: {0}",
    "file_ops_save_fail": "保存失败",
    "file_ops_save_title": "保存项目",
    "file_ops_saved": "项目已保存: {0}",
    "file_ops_select_mod_dir": "选择 HOI4 MOD 或原版目录",
    "file_ops_test_dialog_title": "渐进式测试导出",
    "file_ops_test_export_ok": """Lv{0} 测试MOD已导出到:
{1}

{2}

启动游戏测试是否正常加载。
如果崩溃，降低级别重试；如果能进，升高级别继续。""",
    "file_ops_test_export_title": "测试导出",
    "file_ops_test_generating": "正在生成 Lv{0} 测试MOD...",
    "file_ops_test_lv1_desc": """地图 + State + 1国家(AAA) + 补给 + 战略区域 + replace_path
最小可运行配置，测试基础文件格式是否正确""",
    "file_ops_test_lv1_title": "Lv1: 最小完整MOD（1国家）",
    "file_ops_test_lv2_desc": """在Lv1基础上加: 第2个国家(BBB) + bookmark选择界面
测试多国家和bookmark""",
    "file_ops_test_lv2_title": "Lv2: +2个国家 +bookmark",
    "file_ops_test_lv3_desc": """在Lv2基础上加: ideologies, state_category 定义文件
测试自定义意识形态/State类别""",
    "file_ops_test_lv3_title": "Lv3: +意识形态 +State类别",
    "file_ops_test_lv4_desc": """在Lv3基础上加: 更多replace_path（清空原版国策/事件等）
完整TC MOD""",
    "file_ops_test_lv4_title": "Lv4: +更多replace_path",
    "file_ops_test_output_dir": "选择测试导出目录",
    "file_ops_test_select_level": "选择测试级别（从低到高，逐级排查崩溃原因）:",
    "file_ops_threshold_prompt": """灰度阈值 (0-255)
>= 阈值为陆地，< 阈值为海洋
建议：高度图用 1；卫星图用 90 左右""",
    "file_ops_threshold_title": "陆海阈值",
    "file_ops_vanilla_loaded": "原版地图参考已加载: {0}",
    "file_ops_vanilla_not_found": """未找到原版地图文件
检查路径: {0}""",
}
