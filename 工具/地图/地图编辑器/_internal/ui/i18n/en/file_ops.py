"""
file_ops — en 翻译

本文件由 tools/migrate_i18n.py 生成。后续手动维护。
"""

STRINGS: dict[str, str] = {
    "file_ops_export_fail": "Export Failed",
    "file_ops_img_read_fail": "Failed to read image: {0}",
    "file_ops_import_confirm": "Import will replace current map data. Continue?",
    "file_ops_import_done": "Import Complete",
    "file_ops_import_fail": "Import failed: {0}",
    "file_ops_import_warnings": """Warnings:
""",
    "file_ops_invert_prompt": "Select Yes to invert: dark = land, bright = sea (default No)",
    "file_ops_invert_title": "Invert?",
    "file_ops_landmask_done": "Land/sea import done — land {0}% / sea {1}%",
    "file_ops_landmask_title": "Select Land/Sea Source Image",
    "file_ops_load_fail": "Load Failed",
    "file_ops_loaded": "Project loaded: {0}",
    "file_ops_loaded_gaps": "Project loaded: {0} | ⚠ {1} province ID gaps found",
    "file_ops_map_size_prompt": "Choose a map size for the new project:",
    "file_ops_map_size_title": "Select Map Size",
    "file_ops_missing_files": """Directory is missing required files:
""",
    "file_ops_mod_imported": "MOD map imported ({0}×{1}, {2} provinces, {3} states, {4} strategic regions, {5} art assets)",
    "file_ops_new_confirm": "Creating a new project will clear current data. Continue?",
    "file_ops_new_created": "New project created ({0}×{1})",
    "file_ops_open_title": "Open Project",
    "file_ops_proj_filter": "HOI4 Project (*.hoi4proj);;All Files (*)",
    "file_ops_ref_fail": "Failed to load image",
    "file_ops_ref_loaded": "Reference image loaded: {0}",
    "file_ops_save_fail": "Save Failed",
    "file_ops_save_title": "Save Project",
    "file_ops_saved": "Project saved: {0}",
    "file_ops_select_mod_dir": "Select HOI4 MOD or Vanilla Directory",
    "file_ops_test_dialog_title": "Progressive Test Export",
    "file_ops_test_export_ok": """Lv{0} test MOD exported to:
{1}

{2}

Launch the game to test.
If it crashes, try a lower level; if it works, go higher.""",
    "file_ops_test_export_title": "Test Export",
    "file_ops_test_generating": "Generating Lv{0} test MOD...",
    "file_ops_test_lv1_desc": """Map + State + 1 country (AAA) + supply + strategic regions + replace_path
Minimal runnable config, test basic file format""",
    "file_ops_test_lv1_title": "Lv1: Minimal MOD (1 country)",
    "file_ops_test_lv2_desc": """Lv1 + 2nd country (BBB) + bookmark selection
Test multi-country and bookmark""",
    "file_ops_test_lv2_title": "Lv2: +2 countries +bookmark",
    "file_ops_test_lv3_desc": """Lv2 + ideologies, state_category definitions
Test custom ideologies/state categories""",
    "file_ops_test_lv3_title": "Lv3: +ideology +state categories",
    "file_ops_test_lv4_desc": """Lv3 + more replace_path (clear vanilla focus/events etc.)
Full TC MOD""",
    "file_ops_test_lv4_title": "Lv4: +more replace_path",
    "file_ops_test_output_dir": "Select Test Export Directory",
    "file_ops_test_select_level": "Select test level (low to high, debug crashes step by step):",
    "file_ops_threshold_prompt": """Grayscale threshold (0-255)
>= threshold = land, < threshold = sea
Suggested: 1 for heightmaps; ~90 for satellite images""",
    "file_ops_threshold_title": "Land/Sea Threshold",
    "file_ops_vanilla_loaded": "Vanilla map reference loaded: {0}",
    "file_ops_vanilla_not_found": """Vanilla map files not found
Check path: {0}""",
}
