"""
new_land — en 翻译

本文件由 tools/migrate_i18n.py 生成。后续手动维护。
"""

STRINGS: dict[str, str] = {
    "new_land_generate_confirm_title": "Generate New Land",
    "new_land_generate_confirm_msg": "Will generate provinces for {n} pixels of new land (modifies tile_map and province_map). Undoable (Ctrl+Z). Continue?",
    "new_land_clear": "Clear Brush",
    "new_land_clear_tip": "Clear painted land records (does not delete the land)",
    "new_land_generate": "Generate Provinces",
    "new_land_generate_tip": "Generate provinces for newly painted land",
    "new_land_hint": """Paint new land on ocean with the brush, then click 'Generate Provinces'.
Only the painted area gets new provinces; existing land is unaffected.""",
    "new_land_pixel_count": "Painted: 0 pixels",
    "new_land_pixel_count_fmt": "Painted: {0} pixels",
    "new_land_pixel_painted_fmt": "Painted: {0} pixels",
    "new_land_section_actions": "Actions",
    "new_land_section_brush": "Brush Size",
    "new_land_section_status": "Status",
    "new_land_size_label": "Size",
}
