"""
dialogs — zh 翻译

本文件由 tools/migrate_i18n.py 生成。后续手动维护。
"""

STRINGS: dict[str, str] = {
    "dlg_about_body": """HOI4 幻想世界 MOD 制作工具
HOI4 Fantasy World MOD Maker

Version 0.15
Map size: 5632 x 2048""",
    "dlg_batch_state_done": "已创建州 {sid}（{n} 个省份）",
    "dlg_batch_state_select_first": "请先点击省份选择区域",
    "dlg_batch_state_title": "批量建州",
    "dlg_expand_hint": "点击要扩张的省份，然后拖动画笔将周围像素并入该省份。",
    "dlg_file_not_found": """文件不存在:
{path}""",
    "dlg_gen_mode_body": """当前地图已有省份。

点击 Yes = 只生成新区域的省份（保留已有）
点击 No = 重新生成全部省份""",
    "dlg_gen_mode_title": "省份生成模式",
    "dlg_generate_title": "生成省份",
    "dlg_init_failed": "初始化失败",
    "dlg_language_switched": """语言已切换，部分界面需要重启生效。
Language switched. Some UI elements require restart.""",
    "dlg_language_title": "Language / 语言",
    "dlg_merge_hint": """先点击要保留的省份，再点击要被合并的省份。
被合并省份的像素将并入保留省份。""",
    "dlg_quick_init_body": """将自动生成：
- 州（按地理分组，每州约15个省份）
- 战略区域（按州分组）
- 默认国家 AAA（拥有所有领土）

已有的州/战略区域/国家数据将被覆盖。继续吗？""",
    "dlg_quick_init_done": """一键初始化完成：
""",
    "dlg_quick_init_no_provinces": "请先生成省份",
    "dlg_quick_init_title": "一键初始化",
    "dlg_regen_confirm": """将对 {n} 个省份所在区域重新生成省份。
该区域内的旧省份将被删除并重新划分。

继续吗？""",
    "dlg_regen_done": "删除 {removed} 个旧省份，新建 {created} 个省份。",
    "dlg_regen_done_title": "增量生成完成",
    "dlg_regen_select_first": "请先选择要重新生成的省份区域",
    "dlg_regen_title": "增量生成",
    "dlg_select_mod_dir": "选择 HOI4 MOD 或原版目录",
    "dlg_set_vp_label": """省份 {pid} 的 VP 分值
(1=小镇, 5=中等, 10=城市, 20=首都):""",
    "dlg_set_vp_title": "设置胜利点",
    "dlg_sr_from_states_done": "已创建战略区域 #{rid}（包含 {n} 个州）",
    "dlg_sr_from_states_select_first": "请先点击地图选择州",
    "dlg_sr_from_states_title": "创建战略区域",
    "dlg_update_body": """当前版本：{current}
最新版本：{latest}

更新内容：
{body}

是否前往下载？""",
    "dlg_update_title": "发现新版本",
    "dlg_vp_prompt": "VP 值 (0=删除):",
    "dlg_vp_title_fmt": "胜利点 — 省份 {0}",
    "guide_dont_show": "不再显示",
    "guide_next": "下一步",
    "guide_prev": "上一步",
    "guide_reset_done": "已重置所有模式提示",
    "guide_start": "开始制作",
    "guide_step1_desc": """选择「陆地与海洋」模式，用画笔画出大陆的形状。

• 左键画陆地，切换到「海洋」或「湖泊」画海域
• 填充工具可以快速涂满大面积区域
• 变换工具可以框选一块区域进行移动/缩放
• 也可以导入一张参考图片，对着描绘""",
    "guide_step1_title": "画大陆轮廓",
    "guide_step2_desc": """画完大陆后，点击「生成省份」按钮自动切分区域。

• 调整省份数量滑块控制密度（推荐 3000-12000）
• 海洋和湖泊密度可以单独调节
• 生成后可用合并/切割/套索工具微调边界
• 点击「验证省份」检查是否有问题""",
    "guide_step2_title": "生成省份",
    "guide_step3_desc": """切换到「高度」模式，点击「自动生成」创建高度图。
然后切到「地形」模式，点击「自动生成」按高度分配地形。

• 高度图决定山脉和平原的分布
• 地形影响游戏中的移动速度和战斗加成
• 也可以用画刷手动调整局部区域""",
    "guide_step3_title": "地形与高度",
    "guide_step4_desc": """切换到「州」模式，点击「自动生成州」一键创建。
然后切到「国家」模式，创建国家并分配领土。

• 或者直接点击「一键初始化」自动完成这些步骤
• 双击省份可以设置胜利点
• 每个州需要归属一个国家才能导出""",
    "guide_step4_title": "建州与国家",
    "guide_step5_desc": """切换到「后勤系统」模式，可以设置：

• 邻接关系（跨海连接等特殊通道）
• 铁路网络
• 补给节点

这一步可以跳过，导出时会自动补全基础配置。""",
    "guide_step5_title": "后勤配置（可跳过）",
    "guide_step6_desc": """点击底部的「导出 MOD」按钮，即可生成完整的 HOI4 MOD。

• 导出前会自动检查并修复常见问题
• 生成 2000+ 游戏文件（provinces/states/countries 等）
• 导出完成后直接启动 HOI4 即可进入游戏

祝你的幻想世界玩得愉快！""",
    "guide_step6_title": "一键导出",
    "guide_step_n": "第 {} 步 / 共 {} 步",
    "guide_title": "新手引导",
    "shortcut_col_current": "当前快捷键",
    "shortcut_col_function": "功能",
    "shortcut_col_new": "新快捷键",
    "shortcut_delete": "删除",
    "shortcut_dlg_title": "快捷键设置",
    "shortcut_export": "导出MOD",
    "shortcut_mode_continent": "大洲模式",
    "shortcut_mode_country": "国家模式",
    "shortcut_mode_height": "高度模式",
    "shortcut_mode_land": "大陆模式",
    "shortcut_mode_province": "省份模式",
    "shortcut_mode_river": "河流模式",
    "shortcut_mode_state": "State模式",
    "shortcut_mode_terrain": "地形模式",
    "shortcut_new": "新建项目",
    "shortcut_open": "打开项目",
    "shortcut_redo": "重做",
    "shortcut_save": "保存项目",
    "shortcut_tool_brush": "画笔工具",
    "shortcut_tool_eraser": "橡皮擦",
    "shortcut_tool_fill": "填充工具",
    "shortcut_tool_pan": "平移工具",
    "shortcut_tool_transform": "变换工具",
    "shortcut_undo": "撤销",
    "shortcut_zoom_fit": "适应窗口",
}
