"""
continent — en 翻译

本文件由 tools/migrate_i18n.py 生成。后续手动维护。
"""

STRINGS: dict[str, str] = {
    "continent_remove_confirm_title": "Delete Continent",
    "continent_remove_confirm_msg": "Delete continent \"{name}\"? Provinces in this continent will become continent-less. Undoable (Ctrl+Z).",
    "cont_dlg_add": "Add",
    "cont_dlg_add_prompt": "Continent name (English, no spaces):",
    "cont_dlg_add_title": "Add Continent",
    "cont_dlg_assigned_fmt": "Assigned province {0} → {1}",
    "cont_dlg_assigning_fmt": "Assigning to: {0} — click provinces on canvas",
    "cont_dlg_delete": "Delete",
    "cont_dlg_delete_confirm_fmt": "Delete '{0}'? Provinces assigned to it will be moved to the first continent.",
    "cont_dlg_delete_title": "Delete Continent",
    "cont_dlg_err_min_one": "Must keep at least 1 continent",
    "cont_dlg_err_select": "Please select a continent first",
    "cont_dlg_list_item_fmt": "{0} prov",
    "cont_dlg_rename": "Rename",
    "cont_dlg_rename_prompt": "New name:",
    "cont_dlg_rename_title": "Rename Continent",
    "cont_dlg_start_assign": "Start Assigning Provinces",
    "cont_dlg_stop_assign": "Stop Assigning",
    "cont_dlg_tip": """Usage:
1. Add continents (at least 1 per MOD)
2. Select a continent, click 'Start Assigning'
3. Click land provinces on canvas → assign to continent
4. Click button again to stop""",
    "cont_dlg_title": "Continent Editor",
    "continent_add_btn": "Add",
    "continent_add_dlg_label": "Continent name (English):",
    "continent_add_dlg_title": "Add Continent",
    "continent_assign_by_state": "Assign by State",
    "continent_delete_btn": "Delete",
    "continent_pick_btn": "Start Assigning Provinces",
    "continent_rename_btn": "Rename",
    "continent_rename_dlg_label": "New name:",
    "continent_rename_dlg_title": "Rename",
    "continent_tip": "Define continents and assign provinces.HOI4 requires all land provinces belong to a continent,affects continent.txt and definition.csv.Create continents first (e.g. europe, asia), then use pick modeto assign provinces to the selected continent.",
    "dlg_continent_add_failed": "Failed to add continent",
    "dlg_continent_delete_failed": "Delete failed",
    "dlg_continent_rename_failed": "Rename failed",
}
