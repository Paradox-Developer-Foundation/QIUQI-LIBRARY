"""
river — en 翻译

本文件由 tools/migrate_i18n.py 生成。后续手动维护。
"""

STRINGS: dict[str, str] = {
    "dlg_river_validate_title": "River Validation",
    "river_auto_need_provinces": "Please generate provinces before auto-generating rivers",
    "river_auto_tip": "Auto-draw rivers from heightmap. Manual edit / erase still works after.",
    "river_auto_tooltip": "Auto-generate a reasonable river network based on heightmap, done in seconds",
    "river_brush_btn": "Brush",
    "river_btn_auto": "Auto Generate Rivers",
    "river_btn_auto_new": "🌊 Auto-Generate Rivers",
    "river_btn_auto_tip": "Auto-generate river network from heightmap (flow from mountains to ocean)",
    "river_btn_validate": "Validate Rivers",
    "river_btn_validate_new": "✓ Validate Rivers",
    "river_eraser_btn": "Eraser",
    "river_eraser_range": "Eraser size:",
    "river_hint": "River rules: must be 1px wide, only up/down/left/right (no diagonal)Each river needs 1 source (green). Red=tributary merge, Yellow=forkBrush size only affects eraser range; rivers must be 1px wide",
    "river_label_size": "Size:",
    "river_marker_confluence": "Confluence",
    "river_marker_mouth": "Mouth",
    "river_marker_source": "Source",
    "river_pan_btn": "Pan",
    "river_section_auto": "🪄 Auto-Generate Rivers (Recommended)",
    "river_section_brush_size": "Brush Size",
    "river_section_manual": "✏️ Manual Drawing (3 Steps)",
    "river_section_markers": "Markers (Single Pixel)",
    "river_section_tools": "Tools",
    "river_section_width": "Width Brush",
    "river_step1_title": "<b>Step 1:</b> Select river width",
    "river_step2_hint": """Click-drag from mountains to sea → release
⚠️ Only horizontal/vertical, no diagonal""",
    "river_step2_title": "<b>Step 2:</b> Draw river on map",
    "river_step3_hint": """Each river needs ≥1 source (green)
Mouth marker (yellow) at sea entry
Flow-in (red) where rivers merge""",
    "river_step3_title": "<b>Step 3:</b> Add source/mouth markers",
    "river_tool_brush": "Brush",
    "river_tool_eraser": "Eraser",
    "river_tool_pan": "Pan",
    "river_validate_tooltip": "Check for diagonal pixels, missing sources, etc.",
    "river_width_1": "Trickle",
    "river_width_2": "Small",
    "river_width_4": "Medium",
    "river_width_5": "Large",
    "river_width_7": "Wide",
    "river_width_8": "Huge",
    "river_width_9": "Widest",
    "river_width_note": "💡 Rivers must be 1px wide (HOI4 rule), slider only affects eraser",
}
