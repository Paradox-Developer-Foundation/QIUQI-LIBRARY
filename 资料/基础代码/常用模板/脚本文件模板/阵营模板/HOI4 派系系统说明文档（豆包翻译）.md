# HOI4 派系系统说明文档（中文翻译）

# 缩写说明

- *FI* - 派系主动性（Faction Initiative）

# 派系目标（Faction Goals）

```yaml
faction_goal_id = {

	name = [...] # 目标名称（本地化环境 = 派系 + 玩家国家）
	description = [...] # 目标描述（本地化环境 = 派系 + 玩家国家）
	category = [...] # 目标分类（短期：short_term、中期：medium_term、长期：long_term）
	visible = {
		# 触发器 - 检查目标是否会显示在选择列表中
		# 作用域（SCOPE） = 根作用域（ROOT） = 派系领袖：国家（COUNTRY） / 源作用域（FROM） = 派系成员：国家（COUNTRY）
	}
	available = {
		# 触发器 - 检查目标是否可在选择列表中被选中
		# 作用域（SCOPE） = 根作用域（ROOT） = 派系领袖：国家（COUNTRY） / 源作用域（FROM） = 派系成员：国家（COUNTRY）
	}
	completed = {
		# 触发器 - 检查目标完成条件是否满足
		# 注意：若留空 - 该目标永远无法完成！
		#
		# 作用域（SCOPE） = 派系领袖：国家（COUNTRY）
	}

	group = # UI用于筛选的分类标识。UI资源对应GFX_group，本地化字符串对应group_FACTION_GOAL_FILTER
	
	auto_complete = yes # 当进度达到100%时，自动完成目标
	
	ai_will_do = { # 若有空闲槽位，派系领袖AI选择该目标的概率
		factor = 200 
		# 作用域（SCOPE） = 派系成员：国家（COUNTRY）
	}

	complete_effect = {
		# 效果 - 目标完成时执行一次
		#
		# 作用域（SCOPE） = 派系领袖：国家（COUNTRY）
	}
	
	cancel = {
		# 触发器 - 检查目标是否应从派系中移除
		#
		# 作用域（SCOPE） = 派系领袖：国家（COUNTRY）
	}

	cancel_effect = {
		# 效果 - 目标被取消时执行一次
		#
		# 作用域（SCOPE） = 派系领袖：国家（COUNTRY）
	}

	select_effect = {
		# 效果 - 目标被选中时执行一次，仅在游戏开始后选中目标时生效
		#
		# 作用域（SCOPE） = 派系领袖：国家（COUNTRY）
	}
	remove_effect = {
		# 效果 - 目标被移除时执行一次，仅在游戏开始后移除目标时生效
		#
		# 作用域（SCOPE） = 派系领袖：国家（COUNTRY）
	}

	# 注意：以下代码块为可选 - 仅适用于持续型目标！
	progress = {
		# 我们可以标记进度的不同阶段，为进度的不同区间提供效果（如修正）
		# 具体方式如下：
		#progress_sections = {
		#  可根据需求添加任意数量的阶段，且支持动态生效
		#  新增阶段的语法如下：
		#  	阶段名称本地化（SectionNameLoc） = {
		#  	Min = 阶段起始值（例如0.1表示进度达到10%时，该阶段生效）
		#  	Max = 阶段结束值（例如0.5表示进度超过50%时，离开该阶段）
		#  	若阶段1的Max为0.5，阶段2的Min为0.5，则两个阶段会同时生效
		#	
		#	Modifier = 该阶段生效时应用的修正
		#	Rule = 该阶段生效时应用的新规则
		#	on_activate = 派系目标中此参数无效
		#   on_deactivate = 派系目标中此参数无效
		#	}
		# 
		#}
	}

	ratio_progress = {
		# 进度系统的扩展版本
		# 持续型目标的当前进度值 = 「已完成集合（completed_amount_collection）」的大小 ÷ 「已完成集合（completed_amount_collection）」的大小
		#
		# 注意：脚本化集合（scripted collections）定义在 "common/collections" 目录下
		#
		# 示例：
		#    total_amount_collection = game:all_countries # 游戏中的所有国家
		#    completed_amount_collection = democratic_countries # 实行民主制的国家
		#
		# 在上述示例中，进度定义为「全球民主国家数量」与「全球所有国家数量」的比值；
		# 当所有国家均为民主制时，进度为100%；当没有任何民主制国家时，进度为0%。
		#
		# 两个集合的作用域：均为派系领袖：国家（COUNTRY）
		#
		total_amount_collection = 集合ID（collection_id）
		completed_amount_collection = 集合ID（collection_id）
		
		# 或者，总数量（total_amount）和已完成数量（completed_amount）也可以是固定值或变量：
		total_amount = 自定义数值（MY_VALUE）
		completed_amount = 自定义数值（MY_OTHER_VALUE）
		
		# 注意
		#  - 「total_amount」和「total_amount_collection」互斥！（二选一）
		#  - 「completed_amount」和「completed_amount_collection」互斥！（二选一）

		# 可选参数 - 定义上述计算出的比值如何映射为目标进度
		#
		# 示例：
		#
		#    range = { max = 0.75 }
		#
		# 表示当比值等于或大于0.75时，目标进度设为100%
		#
		# 另一个示例：
		#
		#    range = { min = 0.1 max = 0.8 }
		#
		# 表示：
		#  - 当比值小于或等于0.1时，目标进度设为0%
		#  - 当比值大于或等于0.8时，目标进度设为100%
		#
		# 补充说明：
		#  - min和max均为可选参数，默认值为min = 0，max = 1
		#  - min的值可以大于max，此时进度会随比值的降低而升高，反之亦然
		#
		# range = { min = X max = Y }
	}
}
```

# 派系规则（Faction Rules）

```yaml
faction_rule_id = {

	# 规则类型
	#  - 定义该规则适用的场景
	#  - 决定规则触发器被调用时使用的作用域
	#
	# 可使用任意标识（token），但以下标识具有特殊含义：
	#
	#    joining_rule - 检查某个国家是否可加入派系
	#        作用域（SCOPE） = 申请加入的国家：国家（COUNTRY）
	#        源作用域（FROM） = 派系领袖：国家（COUNTRY）
	#
	#    war_declaration_rule - 检查谁有权宣战
	#        作用域（SCOPE） = 宣战国家：国家（COUNTRY）
	#        源作用域（FROM） = 被宣战目标国家：国家（COUNTRY）
	#	
	#	 call_to_war_rule - 检查谁有权号召战争
	#         作用域（SCOPE） = 号召战争的国家：国家（COUNTRY）
	#         源作用域（FROM） = 被号召战争的目标国家：国家（COUNTRY）
	#
	#    member_rules - 检查派系成员是否可成为流亡政府
	#        作用域（SCOPE） = 派系领袖：国家（COUNTRY）
	#
	#	 change_leader_rules - 检查哪个国家可成为新的派系领袖
	#	 	 作用域（SCOPE） = 拟成为派系领袖的国家：国家（COUNTRY）
	#
	#    peace_conference_rules - 用于包含和平会议期间需应用的和平行动修正列表
	#
	# 规则名称的本地化依赖「国家（Country）」和「派系（Faction）」环境
	#
	type = 规则类型标识（type_token）
	

	visible = {
		# 该规则是否应显示在列表中
		#
		# 作用域（SCOPE） = 派系领袖：国家（COUNTRY）
	}

	available = {
		# 该规则是否对派系可用
		# 注意：此参数不会阻止通过效果（effect）设置该规则！
		#
		# 作用域（SCOPE） = 派系领袖：国家（COUNTRY）
	}

	can_remove = {
		# 若该规则当前处于生效状态，是否可被移除
		# 注意：此参数不会阻止通过效果（effect）移除该规则！
		#
		# 作用域（SCOPE） = 派系领袖：国家（COUNTRY）
	}

	trigger = {
		# 注意：作用域取决于派系类型，详见上文！
	}

	modifier = {
		# 启用该规则后获得的所有修正
	}

	# 引用和平会议期间需应用的和平行动修正
	# 和平行动修正可在 "common/peace_conference/cost_modifiers" 目录下找到
	# 注意1：仅当 type = peace_conference_rules 时生效
	# 注意2：修正的启用触发器不会执行 - 只要规则生效，修正就会启用！
	peace_action_modifiers = {
		# 此分组下的修正列表
	}

	
	ai_will_do = {
		# AI选择该规则的权重修正
		# 若数值 ≤ 0，AI将不会使用该规则
		#
		# 作用域（SCOPE） = 派系领袖：国家（COUNTRY）
	}
}
```

# 派系规则组（Faction Rule Groups）

```yaml
group_id = {
	default_rule = 规则标识（rule_token） # 默认启用的规则
	rules = {
		# 该规则组内的规则列表
		# 注意：可引用数据库（DB）中的规则，或直接内联定义规则
	}
}
```

# 派系模板（Faction Templates）

```yaml
faction_template_id = {

	name = [...] # 派系名称
	
	visible = {
		# 检查当某个国家创建新派系时，该模板是否会显示
		# 若留空 - 该模板不会显示（例如，可用于创建仅能通过脚本生成的派系模板）
		# 
		# 作用域（SCOPE） = 创建派系的国家 : 国家（COUNTRY）
	}
	
	available = {
		# 检查当某个国家创建新派系时，该模板是否可被选择
		# 若留空 - 只要模板显示，就始终可用
		#
		# 作用域（SCOPE） = 创建派系的国家 : 国家（COUNTRY）
	}

    can_leader_join_other_factions = yes
	# 该设置允许派系领袖加入其他派系
	# 若派系领袖退出当前派系，将解散现有派系，并邀请所有可加入新派系的成员一同加入

	manifest = 派系目标ID（faction_goal_id） # 核心目标（派系纲领，faction manifest）

	goals = {
		# 派系的初始目标列表
		# 注意：可引用数据库（DB）中的目标，或直接内联定义目标
	}

	default_rules = {
		# 默认启用的规则列表
		# 此列表会覆盖规则组（rule groups）中定义的默认规则
	}
}
```

# 触发器与效果（Triggers and Effects）

## 派系相关效果列表（List of faction-related effects）

- *create_faction* - 创建无模板的派系（已废弃，OBSOLETE）

- *create_faction_from_template* - 推荐的派系创建方式（新方法）

- *dismantle_faction* - 解散派系

- *set_faction_leader* - 更换派系领袖

- *set_faction_spymaster* - 更换派系间谍主管

- *set_faction_name* - 更改派系名称

- *add_to_faction* - 将某个国家加入派系

- *remove_from_faction* - 将某个国家移出派系

- *leave_faction* - 让当前国家退出派系

- *set_faction_rule* - 为派系设置某项规则

- *set_faction_manifest* - 更改派系的核心目标（纲领）

- *add_faction_goal* - 为派系添加一项目标

- *remove_faction_goal* - 从派系中移除一项目标

- *add_faction_initiative* - 为派系添加FI（派系主动性）

- *add_faction_power_projection* - 为派系增加影响力

- *add_faction_influence_score* - 为派系内的某个国家增加影响力分数

- *add_faction_influence_ratio* - 根据派系总影响力的指定比例，为某个国家增加影响力

## 派系相关触发器列表（List of faction-related triggers）

- *faction_manifest_fulfillment* - 比较当前国家所在派系的核心目标（纲领）完成度与指定数值

- *has_faction_template* - 检查当前国家是否处于由模板创建的派系中

- *faction_power_projection* - 比较当前国家所在派系的影响力与指定数值

- *faction_influence_score* - 检查当前国家在其所在派系中的影响力分数

- *faction_influence_ratio* - 检查当前国家在其所在派系中的影响力比例

- *faction_influence_rank* - 检查当前国家在其所在派系中的影响力排名

- *has_faction_goal* - 检查当前国家所在派系是否有活跃或已完成的目标

- *has_completed_faction_goal* - 检查当前国家所在派系是否已完成某项目标

- *faction_goal_fulfillment* - 检查当前国家所在派系的某项目标完成度

- *has_manpower_to_become_leader* - 检查当前国家的部署人力是否超过当前派系领袖及其附庸国

- *has_industry_to_become_leader* - 检查当前国家的工厂数量是否超过派系领袖

## 派系相关修正列表（List of faction-related modifiers）

- *faction_influence_war_score_factor* - 影响派系影响力的战争分数修正

- *faction_influence_industrial_capacity_factor* - 影响派系影响力的工业产能修正

- *faction_influence_garrison_support_provider_factor* - 影响派系影响力的驻军支援提供方修正

- *faction_influence_garrison_support_reciver_factor* - 影响派系影响力的驻军支援接收方修正（原文笔误，reciver应为receiver）

- *faction_influence_expeditionary_force_provider_factor* - 影响派系影响力的远征军提供方修正

- *faction_influence_expeditionary_force_reciver_factor* - 影响派系影响力的远征军接收方修正（原文笔误，reciver应为receiver）

# 定义（Defines）

## NFactions

- *FACTION_INITIATIVE_CHANGE_RULE_COST* - 花费派系主动性（FI）修改派系规则的成本

# 控制台命令（Console Commands）

- *faction_initiative X* - 为当前玩家所在派系添加X点派系主动性（FI）（快捷键："fi X"）

# 派系成员升级（Faction Member Upgrades）

```yaml
Faction_Member_Upgrade_Id = {
	name = 生效时显示在界面上的名称（本地化字符串键），会覆盖升级组的名称
	desc = 生效时显示在界面上的描述（本地化字符串键），会覆盖升级组的描述
	icon = 生效时显示的图标，会覆盖升级组的图标
	upgrade_cost = 用另一项升级替换该升级所需的派系主动性（FI）数量
	bonus = 数值，根据升级类型决定国家获得的加成幅度
}
```

# 派系成员升级组（Faction Member Upgrade Group）

```yaml
Faction_Upgrade_Group_Id = {
	name = 界面上显示的默认名称（本地化字符串键）
	desc = 界面上显示的默认描述（本地化字符串键）
	icon = 默认显示的图标
	upgrades = {
		该升级组内的派系升级列表，此列表会根据升级的bonus数值排序
	}

   ### 派系成员升级类型列表（有代码支持的类型）
	faction_member_upgrade_manpower = bonus数值表示将本国人力按该百分比投入派系人力池
}
```

# AI派系主动性（FI）花费规则（AI Faction Initiative Spending）

可通过AI策略（AI strategies）影响AI对派系主动性（FI）的花费，示例如下：

```yaml
default_add_faction_facility = {
	enable = {
		always = yes
	}
	abort_when_not_enabled = yes
	ai_strategy = {
		type = spent_faction_initiative_priority
		id = program # <---- 指定FI的花费用途
		value = 5
	}
}
```

有效的id值如下：

```yaml
program
unlock_doctrine_sharing
unlock_faction_commander
```

情报顾问（Intel Advisors）的配置方式略有不同，需使用自定义AI策略类型，示例如下：

```yaml
default_become_spymaster_minor = {
	allowed = {
		has_dlc = "La Resistance" # 需拥有DLC《抵抗运动》
	}
	enable = {
		is_major = no # 非主要国家
	}
	abort_when_not_enabled = yes
	ai_strategy = {
		type = become_spymaster
		value = 2
	}
}
```

有效的type值如下：

```yaml
become_spymaster
become_head_of_crypto
become_head_of_counter_intel
become_head_of_operations
```

派系规则的主动性（FI）花费优先级，在派系规则自身的（ai_will_do）中定义。
> （注：文档部分内容可能由 AI 生成）