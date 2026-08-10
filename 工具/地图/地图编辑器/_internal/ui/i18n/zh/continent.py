"""
continent — zh 翻译

本文件由 tools/migrate_i18n.py 生成。后续手动维护。
"""

STRINGS: dict[str, str] = {
    "continent_remove_confirm_title": "删除大陆",
    "continent_remove_confirm_msg": "删除大陆「{name}」？属于该大陆的省份会变成无大陆。可撤销 (Ctrl+Z)。",
    "cont_dlg_add": "添加",
    "cont_dlg_add_prompt": "大陆名 (英文, 不含空格):",
    "cont_dlg_add_title": "添加大陆",
    "cont_dlg_assigned_fmt": "已指派省份 {0} → {1}",
    "cont_dlg_assigning_fmt": "正在指派到：{0} — 点击主画布省份",
    "cont_dlg_delete": "删除",
    "cont_dlg_delete_confirm_fmt": "删除「{0}」? 指向它的省份会改回首个大陆.",
    "cont_dlg_delete_title": "删除大陆",
    "cont_dlg_err_min_one": "必须至少保留 1 个大陆",
    "cont_dlg_err_select": "请先选中一个大陆",
    "cont_dlg_list_item_fmt": "{0} 省",
    "cont_dlg_rename": "重命名",
    "cont_dlg_rename_prompt": "新名字:",
    "cont_dlg_rename_title": "重命名大陆",
    "cont_dlg_start_assign": "开始指派省份",
    "cont_dlg_stop_assign": "停止指派",
    "cont_dlg_tip": """用法：
1. 添加大陆（每个 MOD 至少 1 个）
2. 选中大陆后点『开始指派』
3. 在主画布点击陆地省份 → 该省份归入该大陆
4. 再次点击按钮结束指派""",
    "cont_dlg_title": "大陆编辑器",
    "continent_add_btn": "添加",
    "continent_add_dlg_label": "大陆名 (英文):",
    "continent_add_dlg_title": "添加大陆",
    "continent_assign_by_state": "按州(State)批量分配",
    "continent_delete_btn": "删除",
    "continent_pick_btn": "开始指派省份",
    "continent_rename_btn": "重命名",
    "continent_rename_dlg_label": "新名字:",
    "continent_rename_dlg_title": "重命名",
    "continent_tip": "定义大陆 + 把省份指派到大陆.HOI4 要求所有陆地省份必须属于某个大洲，影响 continent.txt 和 definition.csv.先创建大陆(如 europe, asia)，再用拾取模式点击省份分配到选中的大陆.",
    "dlg_continent_add_failed": "添加大陆失败",
    "dlg_continent_delete_failed": "删除失败",
    "dlg_continent_rename_failed": "重命名失败",
}
