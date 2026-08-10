NMarket = {
	PURCHASE_CONTRACT_DELIVERY_TOTAL_DAYS = 30,                   	-- Number of days between purchase contract deliveries
	IC_TO_CIC_FACTOR = 2.0,                    						-- The factor for mapping IC cost to CIC cost. Should be a positive number.
	MAX_CIV_FACTORIES_PER_CONTRACT = 15,							-- Max number of factories that can be assigned for paying single contract.
	LOW_PRICE_LEVEL_FACTOR = 0.75,                    				-- The factor of base equipment price for low price level. Should be in range (0,1]
	HIGH_PRICE_LEVEL_FACTOR = 1.25,                    				-- The factor of base equipment price for high price level. Should be more than 1.
	MIN_DELIVERY_LIMIT_WARNING_UI = 0.8,							-- The delivery percentage under we want to let player know the contract is inefficient. [0,1]
	PURCHASE_CONTRACT_SUBSIDY_BONUS_SPEED_FACTOR = 1.0,				-- The factor of speed bonus from subsidies
	CONVOY_WEIGHT_OVERRIDE = 0.0,									-- Overrides the default lend leas weight of convoys for international market
	REQUEST_AUTOMATION_AUTO_ACCEPT_MARKET_ACCESS_DEFAULT = true, 	-- Whether by default should accept market access requests from other countries.
	REQUEST_AUTOMATION_AUTO_SEND_MARKET_ACCESS_DEFAULT = true,		-- Whether by default should send market access requests to other countries.
	REQUEST_AUTOMATION_AUTO_ACCEPT_PURCHASE_DEFAULT = false,		-- Whether by default should accept purchase requests from other countries.
	CONTRACT_ESTIMATE_AVERAGE_CONVOY_COUNT_ALPHA = 0.5,				-- How strong effect should have the daily convoy count on the average (1.0 means it will use only the new number as average)
	CONTRACT_ESTIMATE_AVERAGE_DAILY_PRODUCTION_ALPHA = 0.5, 		-- How strong effect should have the daily production on the average (1.0 means it will use only the new number as average)
	CONTRACT_ESTIMATE_AVERAGE_CONVOY_COUNT_SNAP_LIMIT = 0.3,		-- If the difference between current and estimated available convoy count is smaller then this value, we will use the current value for calculations.
	CONTRACT_ESTIMATE_AVERAGE_DAILY_PRODUCTION_SNAP_LIMIT = 1.5,	-- If the difference between current and estimated daily production is smaller then this value, we will use the current value for calculations.
	CONTRACT_ESTIMATE_AVERAGE_CONVOY_SUNK_MULTIPLIER_ALPHA = 0.5,	-- How strong effect should have the daily sunk efficiency on the average (1.0 means it will use only the new number as average)
	CONTRACT_ESTIMATE_AVERAGE_CONVOY_SUNK_MULTIPLIER_SNAP_LIMIT = 0.05, -- If the difference between current and estimated sunk efficiency convoy count is smaller then this value, we will use the current value for calculations.
	WARNING_CONVOYS_SUNK_MAX_DAYS  = 30, -- The contracts will show sunk convoy message if there was sunk convoy in this amount of days

},

NTechnology = {
	MAX_SUBTECHS = 3,						-- Max number of sub technologies a technology can have.
	BASE_RESEARCH_POINTS_SAVED = 30.0,		-- Base amount of research points a country can save per slot.
	BASE_YEAR_AHEAD_PENALTY_FACTOR = 2,		-- Base year ahead penalty
	BASE_TECH_COST = 110,					-- Base cost for a tech. multiplied with tech cost and ahead of time penalties
	MAX_TECH_SHARING_BONUS = 0.5, 			-- Max technology sharing bonus that can be applied instantly
	LICENSE_PRODUCTION_TECH_BONUS = 0.2,	-- License production tech bonus

	DEFAULT_XP_UNLOCK_RESEARCH_COST = 0,			-- default xp cost of a research to unlock directly
	DEFAULT_XP_BOOST_RESEARCH_COST = 0,				-- default xp cost of a research to speed up the process
	DEFAULT_XP_BOOST_RESEARCH_BONUS = 0,			-- default boost research bonus gained when xp is used to research an item
	MIN_RESEARCH_SPEED = 0.1,						-- research speed can't go below this value

	USE_BONUS_REGRET_TIMER = 3,						-- Number of days the player has to regret using a limited tech bonus
},

NPolitics = {
	BASE_LEADER_TRAITS = 3,				-- Base amount of leader traits.
	MAX_RANDOM_LEADERS = 1,				-- Maximum amount random leader to have per party.
	BASE_POLITICAL_POWER_INCREASE = 2,	-- Weekly increase of PP.
	ARMY_LEADER_COST = 5,					-- command power cost for recruiting new leaders, 'this value' * number_of_existing_leaders_of_type
	NAVY_LEADER_COST = 5,					-- command power cost for recruiting new leaders, 'this value' * number_of_existing_leaders_of_type
	ARMY_LEADER_MAX_COST = 80,				-- max cost BEFORE modifiers
	NAVY_LEADER_MAX_COST = 80,				-- max cost BEFORE modifiers
	LEADER_TRAITS_XP_SHOW = 0.05,			-- Amount of XP a trait needs to be shown in tooltips of a leader.
	REVOLTER_PARTY_POPULARITY = 0.4,		-- Revolter party loses 80% popularity when the civil war breaks out
	MIN_OVERTHROWN_GOVERNMENT_SUPPORT_RATIO = 0.4, -- Min possible support for new government after puppeting the government
	NUM_OCCUPATION_POLICIES = 4,		-- Number of potential occupation policies
	DEFAULT_OCCUPATION_POLICY = 1,		-- Defaullt value for occupation policy
	INSTANT_WIN_REVOLTER_POPULARITY_RATIO = 0.4, -- Min party popularity for instant win in one province state
	INSTANT_WIN_POPULARITY_WIN = 50, -- New party popularity
},

NBuildings = {
	ANTI_AIR_SUPERIORITY_MULT = 5.0,	-- How much air superiority reduction to the enemy does our AA guns? Normally each building level = -1 reduction. With this multiplier.
	SAM_MISSION_SUPERIORITY = 5.0,      -- How much air superiority each SAM mission gives per rocket wing performing SAM missions.
	MAX_BUILDING_LEVELS = 15,			-- Max levels a building can have.
	AIRBASE_CAPACITY_MULT = 200,		-- Each level of airbase building multiplied by this, gives capacity (max operational value). Value is int. 1 for each airplane.
	ROCKETSITE_CAPACITY_MULT = 100,		-- Each level of rocketsite building multiplied by this, gives capacity (max operational value). Value is int. 1 for each rocket.
	NAVALBASE_REPAIR_MULT = 0.05,		-- Each level of navalbase building repairs X strength and can repair as many ships as its level
	RADAR_RANGE_BASE = 20,				-- Radar range base, first level radar will be this + min, best radar will be this + max
	RADAR_RANGE_MIN = 20,				-- Radar range (from state center to province center) in measure of map pixels. Exluding techs.
	RADAR_RANGE_MAX = 200,				-- Range is interpolated between building levels 1-15.
	RADAR_INTEL_EFFECT = 40,			-- Province covered by radar increases intel by 10 (where 255 is max). Province may be covered by multiple radars, then the value sums up.
	SABOTAGE_FACTORY_DAMAGE = 100.0,		-- How much damage takes a factory building in sabotage when state is occupied. Damage is mult by (1 + resistance strength), i.e. up to 2 x base value.
	BASE_FACTORY_REPAIR = 1.0,			-- Default repair rate in percentage before factories are taken into account (1.0 equals 1%).
	BASE_FACTORY_REPAIR_FACTOR = 2.0,	-- Factory speed modifier when repairing.
	SUPPLY_PORT_LEVEL_THROUGHPUT = 3,   -- supply throughput per level of naval base
	MAX_SHARED_SLOTS = 25,				-- Max slots shared by factories
	OWNER_CHANGE_EXTRA_SHARED_SLOTS_FACTOR = 1, --Scale factor of extra shared slots when state owner change.
	DESTRUCTION_COOLDOWN_IN_WAR = 30,	-- Number of days cooldown between removal of buildings in war times

	INFRASTRUCTURE_RESOURCE_BONUS = 0.2, -- multiplicative resource bonus for each level of (non damaged) infrastructure
	SUPPLY_ROUTE_RESOURCE_BONUS = 0.2,   -- multiplicative resource bonus for having a railway/naval connection to the capital
	INFRASTRUCTURE_MUD_EFFECT = -0.8, -- multiplicative effect on mud growth for max infra
},

NMarket = { --市场
	PURCHASE_CONTRACT_DELIVERY_TOTAL_DAYS = 30,                   	-- 单次采购合同的交付间隔天数
	IC_TO_CIC_FACTOR = 2.0,                    						-- IC 到 CIC 的转换系数，必须为正数
	MAX_CIV_FACTORIES_PER_CONTRACT = 15,							-- 单个合同可分配的最大民用工厂数量
	LOW_PRICE_LEVEL_FACTOR = 0.75,                    				-- 低价等级系数：基础价格的倍率，范围 0~1
	HIGH_PRICE_LEVEL_FACTOR = 1.25,                    				-- 高价等级系数：基础价格的倍率，必须大于 1
	MIN_DELIVERY_LIMIT_WARNING_UI = 0.8,							-- 交付比例低于此值时在 UI 提示合同低效，范围 0~1
	PURCHASE_CONTRACT_SUBSIDY_BONUS_SPEED_FACTOR = 1.0,				-- 补贴对交付速度的加速倍率
	CONVOY_WEIGHT_OVERRIDE = 0.0,									-- 覆盖国际市场中运输船的默认租借权重
	REQUEST_AUTOMATION_AUTO_ACCEPT_MARKET_ACCESS_DEFAULT = true, 	-- 是否默认自动接受他国的市场接入请求
	REQUEST_AUTOMATION_AUTO_SEND_MARKET_ACCESS_DEFAULT = true,		-- 是否默认自动向他国发送市场接入请求
	REQUEST_AUTOMATION_AUTO_ACCEPT_PURCHASE_DEFAULT = false,		-- 是否默认自动接受他国的采购请求
	CONTRACT_ESTIMATE_AVERAGE_CONVOY_COUNT_ALPHA = 0.5,				-- 每日运输船数量对均值的影响强度（1 表示仅用新值）
	CONTRACT_ESTIMATE_AVERAGE_DAILY_PRODUCTION_ALPHA = 0.5, 		-- 每日产量对均值的影响强度（1 表示仅用新值）
	CONTRACT_ESTIMATE_AVERAGE_CONVOY_COUNT_SNAP_LIMIT = 0.3,		-- 当前与估算运输船数量差异小于此值时，直接使用当前值
	CONTRACT_ESTIMATE_AVERAGE_DAILY_PRODUCTION_SNAP_LIMIT = 1.5,	-- 当前与估算日产量差异小于此值时，直接使用当前值
	CONTRACT_ESTIMATE_AVERAGE_CONVOY_SUNK_MULTIPLIER_ALPHA = 0.5,	-- 每日运输船沉没效率对均值的影响强度（1 表示仅用新值）
	CONTRACT_ESTIMATE_AVERAGE_CONVOY_SUNK_MULTIPLIER_SNAP_LIMIT = 0.05, -- 当前与估算沉没效率差异小于此值时，直接使用当前值
	WARNING_CONVOYS_SUNK_MAX_DAYS  = 30, -- 若最近 30 天内运输船被击沉，合同将显示警告
},

NTechnology = { --科技
	-- 科技相关定义
	MAX_SUBTECHS = 3,						-- 每项科技最多可拥有的子科技数量
	BASE_RESEARCH_POINTS_SAVED = 30.0,		-- 每个研究槽可储存的基础研究点数
	BASE_YEAR_AHEAD_PENALTY_FACTOR = 2,		-- 超前年份惩罚的基础倍数
	BASE_TECH_COST = 110,					-- 科技基础研究成本（再乘以科技成本和超前惩罚）
	MAX_TECH_SHARING_BONUS = 0.5, 			-- 可瞬间应用的最大科技共享加成
	LICENSE_PRODUCTION_TECH_BONUS = 0.2,	-- 生产许可带来的科技加成倍率

	DEFAULT_XP_UNLOCK_RESEARCH_COST = 0,			-- 默认使用经验直接解锁科技的花费（0 表示禁用）
	DEFAULT_XP_BOOST_RESEARCH_COST = 0,				-- 默认使用经验加速研究的花费（0 表示禁用）
	DEFAULT_XP_BOOST_RESEARCH_BONUS = 0,			-- 使用经验加速研究时获得的默认加成
	MIN_RESEARCH_SPEED = 0.1,						-- 研究速度下限，不会低于此值

	USE_BONUS_REGRET_TIMER = 3,						-- 使用有限科技加成后可撤销的天数
},

NPolitics = { --政治相关定义
	BASE_LEADER_TRAITS = 3,				-- 领袖默认特质数量
	MAX_RANDOM_LEADERS = 1,				-- 每党派最多随机生成的领袖数量
	BASE_POLITICAL_POWER_INCREASE = 2,	-- 每周获得的基础政治点数
	ARMY_LEADER_COST = 5,					-- 招募陆军将领的花费系数（公式：该值 × 已拥有该类型将领数）
	NAVY_LEADER_COST = 5,					-- 招募海军将领的花费系数（同上）
	ARMY_LEADER_MAX_COST = 80,				-- 陆军将领招募的最大基础花费（修正前）
	NAVY_LEADER_MAX_COST = 80,				-- 海军将领招募的最大基础花费（修正前）
	LEADER_TRAITS_XP_SHOW = 0.05,			-- 领袖特质经验值达到此数值时，在提示中显示
	REVOLTER_PARTY_POPULARITY = 0.4,		-- 内战爆发时叛乱政党失去 80% 支持率的基础值
	MIN_OVERTHROWN_GOVERNMENT_SUPPORT_RATIO = 0.4, -- 傀儡政府后新政权最低支持率
	NUM_OCCUPATION_POLICIES = 4,		-- 可选占领政策数量
	DEFAULT_OCCUPATION_POLICY = 1,		-- 默认占领政策（对应列表第 1 项）
	INSTANT_WIN_REVOLTER_POPULARITY_RATIO = 0.4, -- 单省叛乱瞬间胜利所需的最低政党支持率
	INSTANT_WIN_POPULARITY_WIN = 50, -- 瞬间胜利后新政党的支持率
},

NBuildings = { --建筑相关定义
	ANTI_AIR_SUPERIORITY_MULT = 5.0,	-- 防空建筑对敌方空优的削弱倍数（每级建筑默认为 -1，乘以该系数）
	SAM_MISSION_SUPERIORITY = 5.0,      -- SAM 任务提供的空优值（每支执行 SAM 任务的火箭翼）
	MAX_BUILDING_LEVELS = 15,			-- 建筑最高等级
	AIRBASE_CAPACITY_MULT = 200,		-- 空军基地容量倍数（每级建筑提供 等级 × 200 的容量）
	ROCKETSITE_CAPACITY_MULT = 100,		-- 火箭发射场容量倍数（每级建筑提供 等级 × 100 的容量）
	NAVALBASE_REPAIR_MULT = 0.05,		-- 海军基地每级提供的维修倍率（每级修复 等级 × 5% 的舰船强度）
	RADAR_RANGE_BASE = 20,				-- 雷达基础范围（1 级雷达的初始范围）
	RADAR_RANGE_MIN = 20,				-- 雷达最小范围（像素单位，从州中心到省中心）
	RADAR_RANGE_MAX = 200,				-- 雷达最大范围（1-15 级之间插值计算）
	RADAR_INTEL_EFFECT = 40,			-- 雷达覆盖省份提供的情报值（10 = 255 最大值的一部分，多雷达叠加）
	SABOTAGE_FACTORY_DAMAGE = 100.0,		-- 被占领时工厂在破坏中受到的基础伤害（乘 1 + 抵抗强度，最高 2 倍）
	BASE_FACTORY_REPAIR = 1.0,			-- 建筑维修基础速度（1.0 = 1%）
	BASE_FACTORY_REPAIR_FACTOR = 2.0,	-- 工厂维修速度修正系数
	SUPPLY_PORT_LEVEL_THROUGHPUT = 3,   -- 海军基地每级提供的补给吞吐量
	MAX_SHARED_SLOTS = 25,				-- 工厂共享槽位上限
	OWNER_CHANGE_EXTRA_SHARED_SLOTS_FACTOR = 1, -- 州主权变更时共享槽位的额外系数
	DESTRUCTION_COOLDOWN_IN_WAR = 30,	-- 战争期间拆除建筑的冷却天数

	INFRASTRUCTURE_RESOURCE_BONUS = 0.2, -- 每级完好基础设施提供的资源加成倍率（乘性）
	SUPPLY_ROUTE_RESOURCE_BONUS = 0.2,   -- 与首都通过铁路/海运连接时提供的资源加成倍率（乘性）
	INFRASTRUCTURE_MUD_EFFECT = -0.8, -- 最高基础设施对泥泞增长的乘性抑制系数
},