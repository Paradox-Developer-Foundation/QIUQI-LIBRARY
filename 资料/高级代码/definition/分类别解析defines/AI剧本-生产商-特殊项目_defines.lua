NAITheatre = {
	AI_THEATRE_GENERATION_HOME_THEATRE_DEPTH_RESTRICTION = 2,			-- The home theatre is generated based off a initial depth restriction
	AI_THEATRE_GENERATION_BORDER_SIZE_RESTRICTION = 7,					-- Theatres are generated based off borders, Higher value means larger theatres
	AI_THEATRE_GENERATION_DEPTH_TO_START_CONSIDERING_BORDERSTATES = 2,	-- Distance from capital in terms of states
	AI_THEATRE_GENERATION_MINIMUM_STATE_COUNT = 3,						-- Small Theatres - Minimum state count for a theatre
	AI_THEATRE_GENERATION_MAX_DISTANCE_TO_MERGE = 200,					-- Small Theatres - Dont merge with too far away theatres, higher value means less merging will occur
	AI_THEATRE_GENERATION_MAX_DISTANCE_TO_FILL = 350,					-- Final generation step - Max distance to fill states, higher values means less theatres

	AI_THEATRE_DISTRIBUTION_SAME_THEATRE_SCORE_MODIFIER = 0.25, 			-- Value that affects the score of units when distributing to fronts within the same theatre, its a percentage multiplier, the higher it is the higher the chance of units staying in close proximity
	AI_THEATRE_DISTRIBUTION_MAX_SCORE = 250000, 						-- Max Score that a unit can have when being distributed to ai fronts, higher value means more granularity in score changes, lower values means less variation in where units can go
	AI_THEATRE_DISTRIBUTION_PERCENTAGE_OF_MINIMUM_UNITS_TO_KEEP = 1.0,	-- How much should a frontline adheer to its minimum unit demand, when removing/reassigning units
	AI_THEATRE_DISTRIBUTION_MAX_PERCENT_UNMET_DEMAND_PER_FRONT = 0.5,   -- Percentage of how much fronts should request from other lower priority fronts, 0 means once a front gets hold of a unit it stays there forever until its demand is reduced, controlls shuffling of units.

	AI_THEATRE_STATE_UPDATE_MAX_STATE_COUNT_TO_EXPAND = 25,				-- Max theatre size

	AI_THEATRE_BREAKDOWN_MIN_STATE_COUNT = 3,							-- Theatres below this size will break and merge with others
	AI_THEATRE_BREAKDOWN_MAX_DISTANCE_TO_MERGE = 200,					-- Dont merge with too far away theatres, higher value means less merging will occur

	AI_THEATRE_SEARCH_SUPPLY_NODE_MAX_DEPTH = 5,						-- Max depth of breadth-first search while looking for supply nodes when out of supply
	AI_THEATRE_SUPPLY_CRISIS_LIMIT = 0.1,                               -- If a unit is standing in an area with this supply ratio it will try to escape
	AI_THEATRE_AI_FRONT_MIN_DESIRED_RATIO = 0.18,						-- Fronts are sorted based on priority, we nudge unit demand based on this sorting, the higher the value the more units the most important front gets
},
NIndustrialOrganisation = {
	ASSIGN_DESIGN_TEAM_PP_COST_PER_DAY = 0.1,					-- Cost in Political Power daily generation when one MIO is assigned to a research slot. If 0, cost is entirely disabled.
	ASSIGN_INDUSTRIAL_MANUFACTURER_PP_COST_PER_DAY = 0.0,		-- Cost in Political Power daily generation when one MIO is assigned to a production line. If 0, cost is entirely disabled.
	FUNDS_FOR_SIZE_UP = 700,									-- Funds needed for a MIO to increment its size and get points to unlock traits
	FUNDS_FOR_SIZE_UP_LEVEL_FACTOR = 100, 						-- How much each level mutliplies the funds for size up
	FUNDS_FOR_SIZE_UP_LEVEL_POW = 1.8, 							-- the power we applie to the mio size when calculating funds to level up.
	UNLOCKED_TRAITS_PER_SIZE_UP = 1,							-- Number of points for unlocking traits obtained when the MIO increments its size
	DESIGN_TEAM_CHANGE_XP_COST = 0,								-- Flat cost added to the XP cost of a new equipment design. If 0, cost is entirely disabled.
	FUNDS_FOR_RESEARCH_COMPLETION_PER_RESEARCH_COST = 500,     	-- Funds added to MIO when the Design Team has completed a research, multiplied by research_cost in technology template
	FUNDS_FOR_CREATING_EQUIPMENT_VARIANT = 0,					-- Funds added to MIO when a new variant is created with the Design Team assigned to it
	FUNDS_FROM_MANUFACTURER_PER_IC_PER_DAY = 0.1,				-- Funds added to MIO when a manufacturer is attached to a production line. Added every day proportional to IC produced.
	MAX_FUNDS_FROM_MANUFACTURER_PER_DAY = 100,					-- Max funds generated per manufacturer per day. Set to 0 for no Maximum.
	DESIGN_TEAM_RESEARCH_BONUS = 0.05,							-- Research bonus for applying a Design Team that matches the technology
	ENABLE_TASK_CAPACITY = false,								-- Enable limited task capacity for MIOs
	DEFAULT_INITIAL_TASK_CAPACITY = 0,							-- Default start task capacity for each MIO (may be overriden in DB)
	DEFAULT_INITIAL_POLICY_ATTACH_COST = 25,					-- Default start attach cost in PP for policies
	DEFAULT_INITIAL_ATTACH_POLICY_COOLDOWN = 180,				-- Default start cooldown in days after attaching a policy
	LEGACY_COST_FACTOR_SCALE = 1.0,								-- Multiplier to use when legacy Designer cost factors is applied to MIOs (<IdeaGroup>_cost_factor)
},
NProject = {
	FACILITY_SUPPLY_WARNING_RED_RATIO = 0.66,		-- When lacking supply for a facility it will be a yellow icon shown until the supply is less than this value, where it will turn red.
	DEFAULT_COMPLEXITY = 100,						-- Default special project prototype phase to only require one iteration.
	DEFAULT_EMPTY_REWARD_WEIGHT = 1.0,				-- The weight for no reward being given after a prototype iteration.
	DEFAULT_STOP_PROJECT_DAYS = 10,					-- The amount of days it takes for a cancelled project to be stopped.
	DAYS_TO_REMOVE_SCIENTIST = 10,					-- Amount of days needed for a scientist to be unassigned.
	DISMANTLE_FACILITY_DAYS = 100,                   -- Amount of days needed to dismantle a facility.
	PROTOTYPE_PHASE_MAX_PROGRESS = 100,				-- the number of progress points needed to finish the prototype phase and complete the project
	MINIMUM_PROJECT_SPEED_FACTOR_FROM_SUPPLY = 0.2,	-- Minimum special project research speed based on supply
	NEEDED_SUPPLY_FOR_FULL_SPEED_PROJECT = 3.0,	-- Supply needed in province to get full research speed for special project
    MINIMUM_PROJECT_SPEED_FACTOR_FROM_RESOURCE_SHORTAGE = 0.2, -- Minimum special project research speed factor based on resource shortage^M
	ITERATION_REWARD_DEFAULT_WEIGHT = 1.0,			-- If no weight is specified, set it to 1.0
	DEFAULT_PROJECT_COMPLETION_SCIENTIST_EXPERIENCE_GAIN = 192.0,	-- Default experience gain for assigned scientist when a project is completed
	SCIENTIST_INJURED_FACTOR = 0.0,                 -- A factor to reduce the amount of progress gained in a program with attached injured scientist. E.g. 0.5 reduces the progress by 50%
	RECRUIT_SCIENTIST_ONE_TRAIT_CHANCE = 0.35,		-- Chance to get one trait when creating a scientist. E.g. 0.35 = 35% chance to get a trait
	SCIENTIST_BASIC_RESEARCH_DAILY_XP_GAIN = 0.28,	-- Daily experience gain for doing basic research
	RECRUIT_SCIENTIST_COST = {						-- Amount of pp to hire a scientist based on available scientist
		25,			-- pp cost if no available scientist
		50,			-- pp cost if 1 available scientist
		75,			-- pp cost if 2 available scientist
		100			-- pp cost if more than 2 available scientist
	},
	SCIENTIST_SKILL_LEVEL_THRESHOLDS = {			-- Threshold for scientist to level up
		100,		-- to go from level 0 to level 1
		100,		-- to go from level 1 to level 2
		300,		-- to go from level 2 to level 3
		700,		-- ...
		1500,		-- Max level = Array size
	},
	SCIENTIST_SKILL_LEVEL_SPEED_MODIFIER = {		-- Bonus to apply to daily phase progress according to the skill level of the scientist
	    -1.0,    -- -1.0 means -100%         also name loc key is SCIENTIST_SKILL_LEVEL_NAME_0
		-0.05,  -- -0.05 means -5%			also name loc key is SCIENTIST_SKILL_LEVEL_NAME_1
		0.05,	-- 0 means no change		also name loc key is SCIENTIST_SKILL_LEVEL_NAME_2
		0.1,   -- 0.15 means +15%			...
		0.15,
		0.25,	-- Size MUST be SCIENTIST_SKILL_LEVEL_THRESHOLDS's size + 1
	},
	PROJECT_LOSS_FACTOR_ON_CAPTURE = 0.2,              -- Factor of lost progress on project when facility is captured
	PROJECT_CAPTURE_GAIN_RATIO = 0.2,                  -- Ratio of difference from captured facilities ongoing project to receive to the captors' progress
	PROJECT_CAPTURE_BREAKTHROUGH_PROGRESS = 0.1,        -- Ratio of breakthrough progress on capture to the captor for the facilities specialization
	PROJECT_CAPTURE_DIMINISHING_RETURN = 0.6,          -- Reduced amount of gain when capturing a facility with a project you already gained. Will apply the factor each time a capture occurs. 0.6 means a reduction of 60% on next project capture.
	BASIC_RESEARCH_TECHNOLOGY_BONUS_FACTOR = 0.02,     -- Bonus research factor applied to technologies per scientist skill level when performing basic research in a matching facility.
	BASIC_RESEARCH_TECHNOLOGY_BONUS_DIMINISHING_RETURN_FACTOR = 0.5, -- Diminishing return on BASIC_RESEARCH_TECHNOLOGY_BONUS_FACTOR for each extra scientist performing basic research for multiple facilities.
	BREAKTHROUGH_DAILY_TECHNOLOGY_GAIN = 12,           -- Amount in 1/100th percentage. E.g. 25 = 0.25%
	BREAKTHROUGH_DAILY_SCIENTIST_SKILL_GAIN = 5,       -- Amount in 1/100th percentage gained per skill when doing basic research. E.g. 5 = 0.05% per skill level.
	BREAKTHROUGH_DAILY_ROCKET_SITE_GAIN = 1,		   -- Amount in 1/100th percentage gained per rocket site level. E.g. 1 = 0.01% per rocket site level.
	BREAKTHROUGH_DAILY_NUCLEAR_REACTOR_GAIN = 1,       -- Amount in 1/100th percentage gained per nuclear reactor. E.g. 2 = 0.02% per nuclear reactor.
	BREAKTHROUGH_GAIN_ANIMATION_SPEED_MAX = 1.0,	   -- The animation for gaining breakthrough progress is a ratio of this value and current daily gain.
},

NAITheatre = { --AI剧本
	AI_THEATRE_GENERATION_HOME_THEATRE_DEPTH_RESTRICTION = 2,			-- 本土战区的初始深度限制
	AI_THEATRE_GENERATION_BORDER_SIZE_RESTRICTION = 7,					-- 根据边界生成战区，数值越大战区越大
	AI_THEATRE_GENERATION_DEPTH_TO_START_CONSIDERING_BORDERSTATES = 2,	-- 从首都开始计算多少个州后开始考虑边界州
	AI_THEATRE_GENERATION_MINIMUM_STATE_COUNT = 3,						-- 小型战区 - 一个战区最少包含的州数
	AI_THEATRE_GENERATION_MAX_DISTANCE_TO_MERGE = 200,					-- 小型战区 - 不与过远的战区合并，数值越高合并越少
	AI_THEATRE_GENERATION_MAX_DISTANCE_TO_FILL = 350,					-- 最后一步生成 - 填充州的最大距离，数值越高战区越少

	AI_THEATRE_DISTRIBUTION_SAME_THEATRE_SCORE_MODIFIER = 0.25, 			-- 同一战区内部队分配时的分数修正，数值越高越倾向于就近部署
	AI_THEATRE_DISTRIBUTION_MAX_SCORE = 250000, 						-- 部队分配到AI前线时的最大分数，数值越高分数变化越细，越低则部队去向差异越小
	AI_THEATRE_DISTRIBUTION_PERCENTAGE_OF_MINIMUM_UNITS_TO_KEEP = 1.0,	-- 前线在移除/重新分配部队时保留其最低需求的比例
	AI_THEATRE_DISTRIBUTION_MAX_PERCENT_UNMET_DEMAND_PER_FRONT = 0.5,   -- 前线可从低优先级前线请求部队的最大未满足需求比例，0表示一旦分配就不再移动，控制部队流动

	AI_THEATRE_STATE_UPDATE_MAX_STATE_COUNT_TO_EXPAND = 25,				-- 战区最大规模（州数上限）

	AI_THEATRE_BREAKDOWN_MIN_STATE_COUNT = 3,							-- 低于此州数的战区将解散并合并
	AI_THEATRE_BREAKDOWN_MAX_DISTANCE_TO_MERGE = 200,					-- 不与过远的战区合并，数值越高合并越少

	AI_THEATRE_SEARCH_SUPPLY_NODE_MAX_DEPTH = 5,						-- 寻找补给节点时的最大广度优先搜索深度
	AI_THEATRE_SUPPLY_CRISIS_LIMIT = 0.1,                               -- 若单位所在地区补给比例低于此值，将尝试撤离
	AI_THEATRE_AI_FRONT_MIN_DESIRED_RATIO = 0.18,						-- 按优先级排序前线，根据此比例调整部队需求，数值越高最重要的前线获得的部队越多
},

NIndustrialOrganisation = { --生产商
	ASSIGN_DESIGN_TEAM_PP_COST_PER_DAY = 0.1,					-- 每天分配一个设计团队到研究槽时的政治点数消耗（设为0则完全无消耗）
	ASSIGN_INDUSTRIAL_MANUFACTURER_PP_COST_PER_DAY = 0.0,		-- 每天分配一个制造商到生产线时的政治点数消耗（设为0则完全无消耗）
	FUNDS_FOR_SIZE_UP = 700,									-- 军事工业组织升级规模所需资金，升级后可获得解锁特质的点数
	FUNDS_FOR_SIZE_UP_LEVEL_FACTOR = 100, 						-- 每升一级所需资金乘以该系数
	FUNDS_FOR_SIZE_UP_LEVEL_POW = 1.8, 							-- 计算升级资金时对当前等级的指数加成
	UNLOCKED_TRAITS_PER_SIZE_UP = 1,							-- 每次升级规模获得的解锁特质点数
	DESIGN_TEAM_CHANGE_XP_COST = 0,								-- 更换设计团队时的固定经验消耗（设为0则完全无消耗）
	FUNDS_FOR_RESEARCH_COMPLETION_PER_RESEARCH_COST = 500,     	-- 设计团队完成研究后，按科技模板中的研究成本乘以该值给予资金
	FUNDS_FOR_CREATING_EQUIPMENT_VARIANT = 0,					-- 创建装备变种时给予的资金（当前为0）
	FUNDS_FROM_MANUFACTURER_PER_IC_PER_DAY = 0.1,				-- 制造商分配到生产线后，每天根据产出IC给予资金
	MAX_FUNDS_FROM_MANUFACTURER_PER_DAY = 100,					-- 每个制造商每天最多获得的资金上限（设为0则无上限）
	DESIGN_TEAM_RESEARCH_BONUS = 0.05,							-- 设计团队与科技匹配时提供的额外研究加成
	ENABLE_TASK_CAPACITY = false,								-- 是否启用军事工业组织的任务容量限制
	DEFAULT_INITIAL_TASK_CAPACITY = 0,							-- 每个军事工业组织的初始任务容量（可在数据库中覆盖）
	DEFAULT_INITIAL_POLICY_ATTACH_COST = 25,					-- 默认政策附加所需的初始政治点数消耗
	DEFAULT_INITIAL_ATTACH_POLICY_COOLDOWN = 180,				-- 附加政策后的默认冷却天数
	LEGACY_COST_FACTOR_SCALE = 1.0,								-- 旧设计商成本系数应用于军事工业组织时的乘数
},

NProject = { --特殊项目
	FACILITY_SUPPLY_WARNING_RED_RATIO = 0.66,		-- 设施补给不足时显示黄色图标，当补给低于此比例时变为红色
	DEFAULT_COMPLEXITY = 100,						-- 默认特殊项目原型阶段只需一次迭代
	DEFAULT_EMPTY_REWARD_WEIGHT = 1.0,				-- 原型迭代后无奖励的权重
	DEFAULT_STOP_PROJECT_DAYS = 10,					-- 取消项目后完全停止所需天数
	DAYS_TO_REMOVE_SCIENTIST = 10,					-- 解除科学家分配所需天数
	DISMANTLE_FACILITY_DAYS = 100,                   -- 拆除设施所需天数
	PROTOTYPE_PHASE_MAX_PROGRESS = 100,				-- 完成原型阶段所需进度点数
	MINIMUM_PROJECT_SPEED_FACTOR_FROM_SUPPLY = 0.2,	-- 因补给不足导致的最低项目研究速度比例
	NEEDED_SUPPLY_FOR_FULL_SPEED_PROJECT = 3.0,	-- 省份补给达到此值时项目研究速度为100%
    MINIMUM_PROJECT_SPEED_FACTOR_FROM_RESOURCE_SHORTAGE = 0.2, -- 因资源短缺导致的最低项目研究速度比例
	ITERATION_REWARD_DEFAULT_WEIGHT = 1.0,			-- 若未指定权重，则默认为1.0
	DEFAULT_PROJECT_COMPLETION_SCIENTIST_EXPERIENCE_GAIN = 192.0,	-- 项目完成后分配给科学家的默认经验获得值
	SCIENTIST_INJURED_FACTOR = 0.0,                 -- 受伤科学家参与项目时进度减少的系数（0.5表示减少50%）
	RECRUIT_SCIENTIST_COST = {						-- 根据当前可用科学家数量，招募科学家的政治点数消耗
		25,			-- 无可招募科学家时的消耗
		50,			-- 有1位可招募科学家时的消耗
		75,			-- 有2位可招募科学家时的消耗
		100			-- 有3位及以上可招募科学家时的消耗
	},
	SCIENTIST_SKILL_LEVEL_THRESHOLDS = {			-- 科学家升级所需经验阈值
		100,		-- 从0级升到1级
		100,		-- 从1级升到2级
		300,		-- 从2级升到3级
		700,		-- 从3级升到4级
		1500,		-- 最大等级 = 数组长度
	},
	SCIENTIST_SKILL_LEVEL_SPEED_MODIFIER = {		-- 根据科学家技能等级提供的每日阶段进度加成
	    -1.0,    -- -1.0 = -100%   对应本地化键：SCIENTIST_SKILL_LEVEL_NAME_0
		-0.05,   -- -0.05 = -5%    对应本地化键：SCIENTIST_SKILL_LEVEL_NAME_1
		0.05,    -- 0 = 无加成       对应本地化键：SCIENTIST_SKILL_LEVEL_NAME_2
		0.1,     -- 0.15 = +15%     ...
		0.15,
		0.25,	-- 数组长度必须比SCIENTIST_SKILL_LEVEL_THRESHOLDS多1
	},
	PROJECT_LOSS_FACTOR_ON_CAPTURE = 0.2,              -- 设施被占领时项目进度损失比例
	PROJECT_CAPTURE_GAIN_RATIO = 0.2,                  -- 占领敌方设施后，获得其项目进度差值的比例
	PROJECT_CAPTURE_BREAKTHROUGH_PROGRESS = 0.1,        -- 占领设施后，根据设施专业化获得的突破进度比例
	PROJECT_CAPTURE_DIMINISHING_RETURN = 0.6,          -- 重复占领同类项目时的收益递减系数（0.6表示下一次收益减少60%）
	BASIC_RESEARCH_TECHNOLOGY_BONUS_FACTOR = 0.02,     -- 每级科学家技能在匹配设施中进行基础研究时提供的科技加成系数
	BASIC_RESEARCH_TECHNOLOGY_BONUS_DIMINISHING_RETURN_FACTOR = 0.5, -- 多位科学家同时进行基础研究时，科技加成的递减系数
	BREAKTHROUGH_DAILY_TECHNOLOGY_GAIN = 12,           -- 每日科技突破进度增加量（单位为1/100百分比，如12=0.12%）
	BREAKTHROUGH_DAILY_SCIENTIST_SKILL_GAIN = 5,       -- 每级科学家技能每日提供的突破进度（单位为1/100百分比，如5=0.05%）
	BREAKTHROUGH_DAILY_ROCKET_SITE_GAIN = 1,		   -- 每级火箭基地每日提供的突破进度（单位为1/100百分比）
	BREAKTHROUGH_DAILY_NUCLEAR_REACTOR_GAIN = 1,       -- 每座核反应堆每日提供的突破进度（单位为1/100百分比）
	BREAKTHROUGH_GAIN_ANIMATION_SPEED_MAX = 1.0,	   -- 突破进度动画播放速度的上限（与实际每日进度成反比）
},