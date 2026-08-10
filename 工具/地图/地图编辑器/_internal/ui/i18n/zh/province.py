"""
province — zh 翻译

本文件由 tools/migrate_i18n.py 生成。后续手动维护。
"""

STRINGS: dict[str, str] = {
    "btn_generate": "生成",
    "label_land_ratio": "陆地密度倍率:",
    "label_province_count": "省份数量:",
    "prov_bld_bunker": "陆防",
    "prov_bld_cancel": "取消",
    "prov_bld_coastal": "海防",
    "prov_bld_naval": "海军基地",
    "prov_bld_province_id": "省份 ID",
    "prov_bld_save": "保存",
    "prov_bld_tip": """为 state 内每个陆地省份单独配置防御建筑.
0 = 不建. bunker 适用所有陆地, coastal_bunker 和 naval_base 应只给沿海省份.""",
    "prov_bld_title_fmt": "省份建筑 — {0} (ID {1})",
    "province_btn_expand": "扩张省份",
    "province_btn_expand_tip": "开启后：点击省份后拖动扩张边界，松手自动关闭",
    "province_btn_merge": "合并省份",
    "province_btn_merge_tip": "开启后：点第一个省份，再点第二个省份，自动合并并关闭",
    "province_btn_regen_exec": "重新生成选区省份",
    "province_btn_regen_exec_tip": "对选中的省份区域重新生成，其他区域不受影响",
    "province_btn_select_area": "选择区域",
    "province_btn_select_area_tip": "开启后点击省份选择区域（多选），再点「重新生成」",
    "province_btn_split": "切割选中省份",
    "province_btn_split_tip": "先点击选中一个省份，再点此按钮切割",
    "province_coastal_no": "否",
    "province_coastal_yes": "是",
    "province_hint_click_info": "点击省份查看信息",
    "province_hint_default": "点击查看省份信息。合并/扩张/切割需先点对应按钮开启",
    "province_hint_expand": "扩张模式：点击省份后拖动扩张",
    "province_hint_merge": "合并模式：点第一个省份，再点第二个",
    "province_hint_regen": "增量生成：点击省份选择区域（多选），然后点「重新生成」",
    "province_hint_split": "切割模式：在省份上画一条线，松手沿线切开",
    "province_info_coastal": "沿海",
    "province_info_compact_default": "ID: — | — | — | 0px",
    "province_info_id": "省份 ID",
    "province_info_pixels": "像素数",
    "province_info_terrain": "地形",
    "province_info_type": "类型",
    "province_section_info": "省份信息",
    "province_section_regen": "增量生成",
    "province_section_tools": "省份操作",
}
