"""
dialogs — en 翻译

本文件由 tools/migrate_i18n.py 生成。后续手动维护。
"""

STRINGS: dict[str, str] = {
    "dlg_about_body": """HOI4 Fantasy World MOD Maker

Version 0.15
Map size: 5632 x 2048""",
    "dlg_batch_state_done": "Created state {sid} ({n} provinces)",
    "dlg_batch_state_select_first": "Please click provinces to select area first",
    "dlg_batch_state_title": "Batch Create State",
    "dlg_expand_hint": "Click the province to expand, then drag the brush to absorb nearby pixels.",
    "dlg_file_not_found": """File not found:
{path}""",
    "dlg_gen_mode_body": """Map already has provinces.

Click Yes = generate only for new areas (keep existing)
Click No = regenerate all provinces""",
    "dlg_gen_mode_title": "Province Generation Mode",
    "dlg_generate_title": "Generate Provinces",
    "dlg_init_failed": "Initialization Failed",
    "dlg_language_switched": """Language switched. Some UI elements require restart.
语言已切换，部分界面需要重启生效。""",
    "dlg_language_title": "Language / 语言",
    "dlg_merge_hint": """Click the province to keep first, then click the province to merge.
Merged province pixels will be absorbed into the kept province.""",
    "dlg_quick_init_body": """Will auto-generate:
- States (grouped geographically, ~15 provinces each)
- Strategic regions (grouped by state)
- Default country AAA (owns all territory)

Existing state/region/country data will be overwritten. Continue?""",
    "dlg_quick_init_done": """Quick init complete:
""",
    "dlg_quick_init_no_provinces": "Please generate provinces first",
    "dlg_quick_init_title": "Quick Init",
    "dlg_regen_confirm": """Will regenerate provinces in the area of {n} provinces.
Old provinces in this area will be deleted and repartitioned.

Continue?""",
    "dlg_regen_done": "Deleted {removed} old provinces, created {created} new provinces.",
    "dlg_regen_done_title": "Incremental Regen Complete",
    "dlg_regen_select_first": "Please select province area to regenerate first",
    "dlg_regen_title": "Incremental Regen",
    "dlg_select_mod_dir": "Select HOI4 MOD or Vanilla Directory",
    "dlg_set_vp_label": """VP value for province {pid}
(1=town, 5=medium, 10=city, 20=capital):""",
    "dlg_set_vp_title": "Set Victory Point",
    "dlg_sr_from_states_done": "Created strategic region #{rid} (containing {n} states)",
    "dlg_sr_from_states_select_first": "Please click map to select states first",
    "dlg_sr_from_states_title": "Create Strategic Region",
    "dlg_update_body": """Current version: {current}
Latest version: {latest}

Changelog:
{body}

Go to download?""",
    "dlg_update_title": "New Version Available",
    "dlg_vp_prompt": "VP Value (0=remove):",
    "dlg_vp_title_fmt": "Victory Point — Province {0}",
    "guide_dont_show": "Don't show again",
    "guide_next": "Next",
    "guide_prev": "Previous",
    "guide_reset_done": "All mode hints have been reset",
    "guide_start": "Start Creating",
    "guide_step1_desc": """Select 'Land & Sea' mode and draw your continent shapes.

• Left-click to paint land; switch to Sea/Lake to paint water
• Use Fill tool to quickly cover large areas
• Use Transform tool to select, move, and scale regions
• You can also import a reference image to trace over""",
    "guide_step1_title": "Draw Continents",
    "guide_step2_desc": """After drawing continents, click 'Generate Provinces' to auto-split regions.

• Adjust the province count slider (recommended: 3000-12000)
• Sea and lake density can be set independently
• Use Merge / Split / Lasso tools to fine-tune borders
• Click 'Validate' to check for issues""",
    "guide_step2_title": "Generate Provinces",
    "guide_step3_desc": """Switch to 'Height' mode and click 'Auto Generate' for a heightmap.
Then switch to 'Terrain' and click 'Auto Generate' to assign terrain by height.

• Heightmap determines mountain and plain distribution
• Terrain affects movement speed and combat bonuses in-game
• You can also manually paint specific areas with brushes""",
    "guide_step3_title": "Terrain & Height",
    "guide_step4_desc": """Switch to 'State' mode and click 'Auto Generate States'.
Then switch to 'Country' to create nations and assign territory.

• Or just click 'Quick Init' to do all of this automatically
• Double-click a province to set a victory point
• Every state must belong to a country for export""",
    "guide_step4_title": "States & Countries",
    "guide_step5_desc": """Switch to 'Logistics' mode to set up:

• Adjacencies (cross-sea connections, special passages)
• Railway networks
• Supply nodes

This step is optional — basic config is auto-generated on export.""",
    "guide_step5_title": "Logistics (Optional)",
    "guide_step6_desc": """Click the 'Export MOD' button at the bottom to generate a complete HOI4 MOD.

• Pre-export checks will auto-fix common issues
• Generates 2000+ game files (provinces/states/countries, etc.)
• Launch HOI4 after export and jump right into your world

Enjoy building your fantasy world!""",
    "guide_step6_title": "Export & Play",
    "guide_step_n": "Step {} of {}",
    "guide_title": "Getting Started",
    "shortcut_col_current": "Current Shortcut",
    "shortcut_col_function": "Function",
    "shortcut_col_new": "New Shortcut",
    "shortcut_delete": "Delete",
    "shortcut_dlg_title": "Shortcut Settings",
    "shortcut_export": "Export MOD",
    "shortcut_mode_continent": "Continent Mode",
    "shortcut_mode_country": "Country Mode",
    "shortcut_mode_height": "Height Mode",
    "shortcut_mode_land": "Land Mode",
    "shortcut_mode_province": "Province Mode",
    "shortcut_mode_river": "River Mode",
    "shortcut_mode_state": "State Mode",
    "shortcut_mode_terrain": "Terrain Mode",
    "shortcut_new": "New Project",
    "shortcut_open": "Open Project",
    "shortcut_redo": "Redo",
    "shortcut_save": "Save Project",
    "shortcut_tool_brush": "Brush Tool",
    "shortcut_tool_eraser": "Eraser",
    "shortcut_tool_fill": "Fill Tool",
    "shortcut_tool_pan": "Pan Tool",
    "shortcut_tool_transform": "Transform Tool",
    "shortcut_undo": "Undo",
    "shortcut_zoom_fit": "Fit to Window",
}
