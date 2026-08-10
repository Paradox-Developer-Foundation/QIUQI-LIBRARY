NCharacter = {
	OFFICER_CORP_ADVISOR_ENTRIES_IN_MENU = { "high_command", "theorist", "army_chief", "air_chief", "navy_chief" },
	OFFICER_CORP_HIGH_COMMAND_SLOTS_IN_MENU = 3, --For Alert manager to count the number of High Command Slots in the UI
	POLITICAL_ADVISOR_SLOTS_IN_MENU = 3, --For Alert manager to count the number of Political Advisor Slots in the UI

	DEFAULT_PP_COST_FOR_MILITARY_ADVISOR = 50,	-- When an advisor does not have cost assigned this is the default used
	DEFAULT_PP_COST_FOR_POLITICAL_ADVISOR = 150,
	DEFAULT_CP_COST_FOR_ADVISOR = 0,	-- For Starting Advisors
	DEFAULT_CP_COST_FOR_DYNAMIC_ADVISORS = 0,	-- For Advisors created during gameplay
	ADVISOR_PROMOTION_COST = 5,	-- Cost to promote someone to advisor

	COUNTRY_LEADER_BASE_EXPIRE_YEAR_LENGTH = 5, -- When creating a dynamic country leader if an expire date is not set it will have 5 years as a base expiration date
	COUNTRY_LEADER_BASE_RANDOM_MAX_YEAR_LENGTH = 15, -- Max random value added to COUNTRY_LEADER_BASE_EXPIRE_YEAR_LENGTH

	SPECIALIST_ADVISOR_MIN_RANK = 4,
	EXPERT_ADVISOR_MIN_RANK = 6,
	GENIUS_ADVISOR_MIN_RANK = 8,
},

NSupply = {
	MAX_RAILWAY_LEVEL = 5, -- update railway texture as well, each frame corresponds to a level

	--defines to calculate the capitals supply. This will be also used for max supply of other nodes depending on how well they are connected to capital. Using the formula:
	--CapitalSupply = CAPITAL_SUPPLY_BASE + (NumberOfCivilianFactories * CAPITAL_SUPPLY_CIVILIAN_FACTORIES) + (NumberOfMilitaryFactories * CAPITAL_SUPPLY_MILITARY_FACTORIES) + (NumberOfDockyards * CAPITAL_SUPPLY_DOCKYARDS)
	CAPITAL_SUPPLY_BASE = 5.0, -- base supply for capital
	CAPITAL_SUPPLY_CIVILIAN_FACTORIES = 0.3, -- supply from one civilian factory
	CAPITAL_SUPPLY_MILITARY_FACTORIES = 0.6, -- supply from one military factory
	CAPITAL_SUPPLY_DOCKYARDS = 0.4, --supply from one naval factory

	-- defines that are used for supply reach for capital
	-- supply flow will start from INITIAL_SUPPLY_FLOW and will be reduced by a penalty on each province it travels (which depends on how far we are from our origin, terrain etc)
	-- a supply reach >= 1.0 considered "perfect" and will be able to fully support units on that particular province (assuming you are not over capacity)
	CAPITAL_INITIAL_SUPPLY_FLOW = 5.0, -- starting supply from
	CAPITAL_STARTING_PENALTY_PER_PROVINCE = 0.5, -- starting penalty that will be added as supply moves away from its origin (modified by stuff like terrain)
	CAPITAL_ADDED_PENALTY_PER_PROVINCE = 1.2, -- added penalty as we move away from origin

	-- defines that are used for supply reach for built nodes
	NODE_INITIAL_SUPPLY_FLOW = 2.8,
	NODE_STARTING_PENALTY_PER_PROVINCE = 0.50,
	NODE_ADDED_PENALTY_PER_PROVINCE = 0.70,

	-- defines that are used for supply reach for dockyards
	NAVAL_BASE_INITIAL_SUPPLY_FLOW = 3.3,
	NAVAL_BASE_STARTING_PENALTY_PER_PROVINCE = 0.84,
	NAVAL_BASE_ADDED_PENALTY_PER_PROVINCE = 1.1,

	-- Node Flow (i.e. province caps) increase by this amount per railway level of the node's bottleneck
	NODE_FLOW_BONUS_PER_RAIL_LEVEL = 0.34,

	-- rivers will transfer in between nodes as if they were this level
	RIVER_RAILWAY_LEVEL = 1,

	-- defines that are used for supply reach for floating harbors
	FLOATING_HARBOR_INITIAL_SUPPLY_FLOW = 2.6,
	FLOATING_HARBOR_STARTING_PENALTY_PER_PROVINCE = 0.8,
	FLOATING_HARBOR_ADDED_PENALTY_PER_PROVINCE = 0.8,

	FLOATING_HARBOR_BASE_SUPPLY = 15.0, -- supply given by a floating harbor
	FLOATING_HARBOR_BASE_DURATION = 21, -- duration of a full hp floating harbor
	FLOATING_HARBOR_DURATION_RATIO_AT_MIN_HP = 0.0,  -- duration mult for a harbor that was reduced to 0 hp

	FLOATING_HARBOR_MIN_DECAY = 0.2, -- Always reduce Floating Harbor longevity by this many "hours" per hour
	FLOATING_HARBOR_DECAY_MAX_AIR_BONUS = -0.1, -- At 100% Friendly Air superiourity, change decay rate by this many "hours" per hour
	FLOATING_HARBOR_DECAY_MAX_AIR_PENALTY = 0.4, -- At 100% Enemy Air superiourity, change decay rate by this many "hours" per hour
	FLOATING_HARBOR_DECAY_MAX_NAVAL_BONUS = -0.2, -- At 100% Friendly naval superiourity, change decay rate by this many "hours" per hour
	FLOATING_HARBOR_DECAY_MAX_NAVAL_PENALTY = 0.5, -- At 100% Enemy Naval superiourity, change decay rate by this many "hours" per hour
	FLOATING_HARBOR_DECAY_NO_CONTROL_PENALTY = 1.0, -- If adjacent land province is not held, change decay rate by this many "hours" per hour

	SUPPLY_FLOW_DROP_REDUCTION_AT_MAX_INFRA = 0.30, -- max infrastructure level will reduce the supply flow drop off by this ratio
	SUPPLY_FLOW_PENALTY_CROSSING_RIVERS = 0.20, -- crossing rivers introduces additional penalty

	 -- node flow terrain falloff is scaled by logistics curve based on distance(d) (scalar / (1+e^(-k(d-midpoint))))
	SUPPLY_FLOW_DIST_LOGISTICS_FALLOFF_K = 1.3, -- How steep the curve is
	SUPPLY_FLOW_DIST_LOGISTICS_FALLOFF_MIDPOINT = 2.3, -- sigmoid inflection point
	SUPPLY_FLOW_DIST_LOGISTICS_FALLOFF_SCALAR = 0.9, -- Max Penalty adjustment due to distance
	SUPPLY_FLOW_DIST_LOGISTICS_FALLOFF_MIN_PENALTY_SCALE = 0.25, -- Logistics curve never reduces penalty facor below this limit

	-- The range bonus added to a fully motorized hub. This supply is added on top of the XXX_INITIAL_SUPPLY_FLOW defined above.
	SUPPLY_HUB_FULL_MOTORIZATION_BONUS = 2.2,
	-- How many trucks does it cost to fully motorize a hub
	SUPPLY_HUB_FULL_MOTORIZATION_TRUCK_COST = 60.0,
	-- For each additional level of motorization on a hub (i.e. contry with set motoriazation) reduce max bonus for next level by this amount
	SUPPLY_HUB_MOTORIZATION_MARGINAL_EFFECT_DECAY = 1.6,


	-- used for calculating "flow" for railways.
	RAILWAY_BASE_FLOW = 10.0, 		-- how much base flow railway gives when a node connected to its capital/a naval node by a railway
	RAILWAY_FLOW_PER_LEVEL = 5.0, 	-- how much additional flow a railway level gives
	RAILWAY_FLOW_PENALTY_PER_DAMAGED = 5.0, -- penalty to flow per damaged railway
	RAILWAY_MIN_FLOW = 5.0, 		-- minimum railway flow can be reduced to

	-- used for calculating "flow" from a naval node to another naval node when it is connected via a convoy route
	-- NAVAL_BASE_MAX_SUPPLY_FLOW_FACTOR = 0.9, -- flow of the parent node is factored to this ratio (so at most it can transfer parent naval node flow * this define)
	NAVAL_BASE_FLOW = 5.0, -- max output/input of a naval node is limited by this base value + additional ratio for each level
	NAVAL_FLOW_PER_LEVEL = 3.0, -- max output/input of a naval node is limited by previous base value + this define per its level

	SUPPLY_NODE_MIN_SUPPLY_THRESHOLD = 1.0, -- if supply of a node is below this value it will be set to 0 -- Currently unused? This should happen when enough damage occurs

	INFRA_TO_SUPPLY = 0.3,							-- each level of infra gives this many supply
	VP_TO_SUPPLY_BASE = 0.2,							-- Bonus to supply from a VP, no matter the level
	VP_TO_SUPPLY_BONUS_CONVERSION = 0.05,			-- Bonus to supply local supplies from Victory Points, multiplied by this aspect and rounded to closest integer
	SUPPLY_FROM_DAMAGED_INFRA = 0.15,                -- damaged infrastructure counts as this in supply calcs
	SUPPLY_BASE_MULT = 0.2,							-- multiplier on supply base values
	SUPPLY_DISRUPTION_DAILY_RECOVERY = 1.5,		-- every day nodes recover this much of their accumulated disruption.

	RAILWAY_CONVERSION_COOLDOWN = 10, -- railways will be put on cooldown when they are captured by enemy and will not be usable during the cooldown
	RAILWAY_CONVERSION_COOLDOWN_CORE = 5,
	RAILWAY_CONVERSION_COOLDOWN_CIVILWAR = 0,

	DEFAULT_STARTING_TRUCK_RATIO = 1.5, -- countries get this ratio of starting truck in their buffers compared to their need
	DEFAULT_STARTING_TRAIN_RATIO = 1, -- countries get this ratio of starting trains in their buffers compared to their need

	SUPPLY_POINTS_PER_TRAIN = 1.0,  -- old default 1.25 -- Amount of supply that can fit in a train. (Trains distribute supply from capital to a supply node.)
	NUM_RAILWAYS_TRAIN_FACTOR = 0.03, -- the train usage is scaled by railway distance between the supply node and the capital multiplied by this factor

	BASE_SUPPLY_MULT_FOR_TRUCK_DEFAULT_BUFFER = 1.0,  -- initial value for wanted buffers over potential truck usage
	BASE_SUPPLY_MULT_FOR_TRUCK_MIN_BUFFER = 0.0, -- min and max values for buffer ratio
	BASE_SUPPLY_MULT_FOR_TRUCK_MAX_BUFFER = 100.0,

	TRUCK_ATTRITION = 0.003, -- base truck attrition
	TRUCK_ATTRITION_FACTOR = 0.65, --a scale on total truck attrition

	BASE_TRUCK_HP = 100.0,
	TRUCK_HP_PER_ARMOR = 2,

	BASE_TRAIN_HP = 100.0,
	TRAIN_ARMOR_TARGETING_WEIGHT = 0.01, -- For each health point gained by armor_value, enemy bombers are this much more likely to target
	TRAIN_ANTI_AIR_HIT_CHANCE = 0.07, -- Balancing value to determine the chance of train anti-air hitting an attacking airwing.
	TRAIN_ANTI_AIR_HIT_ROLL_COUNT = 12, -- The air_attack of all attacked trains are accumulated, and then we do this many random rolls each with the hit chance set above to determine the fraction of the accumulated air_attack that hits.
	TRAIN_ANTI_AIR_ATTACK_TO_AMOUNT = 0.001, -- Balancing value to convert the hitting air_attack to a percentage value of the attacking planes that are killed.

	MIN_TRAIN_SUPPLY_FACTOR = 0.5, -- Having 0 trains in stockpile only applies this penalty factor, scaling up to 1.0 when need is met
	MIN_TRAIN_REQUIREMENT = 2, -- If total train need <= this, then don't apply any supply penalty, even if stockpile is insufficient

	SUPPLY_FLOW_REDUCTION_THRESHOLD = 0.1, -- if supply flow is lower than this, it is not applied

	-- following values are used for calculating potential truck usage
	-- generally potential is ~= current usage but as units moves along the map
	-- they are assigned to different nodes which adds slightly higher usage due to minimum truck needed being 1
	BASE_AIR_SUPPLY_MULT_FOR_TRUCK_BUFFER = 1.0,
	BASE_ARMY_SUPPLY_MULT_FOR_TRUCK_BUFFER = 1.0,
	BASE_NAVY_SUPPLY_MULT_FOR_TRUCK_BUFFER = 1.0,

	CAPITAL_NODE_BASE_SUPPLY_ADD = 0,
	BUILT_NODE_BASE_SUPPLY_ADD = 0.6,
	LOCAL_NODE_BASE_SUPPLY_ADD = 0.5,
	NAVAL_NODE_BASE_SUPPLY_ADD = 0.3,
	-- ~end

	-- armies slowly gains and buffers supply above >100% up to their supply grace if they have efficent supply flow
	-- otherwuse they will lose up to 100% supply every day depending on how bad supply flow is
	ARMY_SUPPLY_RATIO_STARTING_GAIN = 0.0,
	ARMY_SUPPLY_RATIO_SPEED_GAIN_PER_HOUR = 0.01,
	ARMY_MAX_SUPPLY_RATIO_GAIN_PER_HOUR = 0.15,

	MIN_SURRENDER_LIMIT_TO_MOVE_SUPPLY_CAPITAL = 0.15, -- country needs to be above thos surrender ratio to be able to move its capital
	COOLDOWN_DAYS_AFTER_MOVING_SUPPLY_CAPITAL = 30, -- cooldown for moving supply again after last move
	DAYS_TO_START_GIVING_SUPPLY_AFTER_MOVING_SUPPLY_CAPITAL = 7,  -- the country will start gaining supply after this many days moving its capital
	DAYS_TO_START_GIVING_FULL_SUPPLY_AFTER_MOVING_SUPPLY_CAPITAL =  21, -- the country will reach max supply after this many days moving its capital

	MIN_DIFF_FOR_AUTO_UPDATING_EXISTING_RAILWAYS = 5, -- while building railways, the system will prefer updating existing railway if new railway is close enough to existing one

	-- reinforcements depends on distance to capital and following defines are used for calculating reinforcement time
	SUPPLY_PATH_MAX_DISTANCE = 15,	-- max time it can take
	RAILWAY_DISTANCE_FACTOR_FOR_REINFORCEMENT_SPEED = 0.3, -- time factor for total railway distance
	TRUCK_DISTANCE_FACTOR_FOR_REINFORCEMENT_SPEED = 0.01, -- time factor for total truck distance
	NAVAL_DISTANCE_FACTOR_FOR_REINFORCEMENT_SPEED = 0.08, -- time factor for total naval distance

	ALERT_VERY_LOW_SUPPLY_LEVEL = 0.2,			   -- At which point we show up the low and very low supply level alert. Value is in % of supplies supported vs required.
	ALERT_LOW_SUPPLY_LEVEL = 0.5,

	AI_FRONT_MINIMUM_UNITS_PER_PROVINCE_FOR_SUPPLY_CALCULATIONS = 1,    -- AI will try to keep this amount of divisions per province as a minimum when evaluating supply limitations for war fronts
	AI_FRONT_DIVISIONS_PER_SUPPLY_POINT = 1.0, -- How many divisions should the AI consider it can supply per available supply point
	AI_FRONT_MAX_UNITS_ENEMY_COUNT_FACTOR = 1.2, -- Make sure AI front MaxNrUnits is at least EnemyCount multiplied by this factor
	SUPPLY_THRESHOLD_FOR_ARMY_ATTRITION = 0.35, -- armies will only get attrition below this supply
	NUMBER_OF_SHOWN_SUPPLY_SOURCES_IN_SUPPLY_MAPMODE = 3, -- number of supply flow sources shown in breakdown tooltip
	ESTIMATED_DIVISION_WEIGHT_FOR_SUPPLY_ESTIMATIONS_GUI = 1.0,	--Division supply consumption used for estimating frontline weight for order tooltips
	AVAILABLE_MANPOWER_STATE_SUPPLY = 0.18,						--Factor for state supply from max manpower (population)
	NON_CORE_MANPOWER_STATE_SUPPLY = 0.2,						--Factor for population sttate supply when controlled by an occupier (NO TAKE FOOD)
	STORED_SUPPLY_CONSUMPTION_RATE_FACTOR = 0.75,				--Multiplies consumption rate of stored supply (more/less easement)
},

NCharacter = { --顾问
	OFFICER_CORP_ADVISOR_ENTRIES_IN_MENU = { "high_command", "theorist", "army_chief", "air_chief", "navy_chief" },
	OFFICER_CORP_HIGH_COMMAND_SLOTS_IN_MENU = 3, -- 用于警报管理器统计UI中“高级指挥”槽位数量
	POLITICAL_ADVISOR_SLOTS_IN_MENU = 3, -- 用于警报管理器统计UI中“政治顾问”槽位数量

	DEFAULT_PP_COST_FOR_MILITARY_ADVISOR = 50,	-- 当军事顾问未指定花费时，使用此默认值
	DEFAULT_PP_COST_FOR_POLITICAL_ADVISOR = 150,	-- 当政治顾问未指定花费时，使用此默认值
	DEFAULT_CP_COST_FOR_ADVISOR = 0,	-- 起始顾问的指挥点花费
	DEFAULT_CP_COST_FOR_DYNAMIC_ADVISORS = 0,	-- 游戏过程中生成的顾问的指挥点花费
	ADVISOR_PROMOTION_COST = 5,	-- 将某人晋升为顾问的花费

	COUNTRY_LEADER_BASE_EXPIRE_YEAR_LENGTH = 5, -- 动态生成国家领导人时，若未设置到期日，则默认基础年限为5年
	COUNTRY_LEADER_BASE_RANDOM_MAX_YEAR_LENGTH = 15, -- 在基础年限上额外增加的最大随机年数

	SPECIALIST_ADVISOR_MIN_RANK = 4,	-- 需要至少4级才能成为“专家”顾问
	EXPERT_ADVISOR_MIN_RANK = 6,	-- 需要至少6级才能成为“大师”顾问
	GENIUS_ADVISOR_MIN_RANK = 8,	-- 需要至少8级才能成为“天才”顾问
},

NSupply = { -- 补给
	MAX_RAILWAY_LEVEL = 5, -- 同时更新铁路贴图，每级对应一个贴图帧

	-- 以下定义用于计算首都的补给上限，也用于计算其他节点与首都连接良好时的最大补给。公式如下：
	-- 首都补给 = 首都基础补给 + (民用工厂数量 × 每民用工厂补给) + (军用工厂数量 × 每军用工厂补给) + (船坞数量 × 每船坞补给)
	CAPITAL_SUPPLY_BASE = 5.0, -- 首都基础补给量
	CAPITAL_SUPPLY_CIVILIAN_FACTORIES = 0.3, -- 每个民用工厂提供的补给量
	CAPITAL_SUPPLY_MILITARY_FACTORIES = 0.6, -- 每个军用工厂提供的补给量
	CAPITAL_SUPPLY_DOCKYARDS = 0.4, -- 每个海军工厂提供的补给量

	-- 以下定义用于计算首都的补给范围
	-- 补给流从 INITIAL_SUPPLY_FLOW 开始，每经过一个省份就会受到一个惩罚（取决于与原点的距离、地形等）
	-- 补给范围 ≥ 1.0 视为“完美”，可完全支持该省份的单位（前提是未超载）
	CAPITAL_INITIAL_SUPPLY_FLOW = 5.0, -- 首都起始补给流量
	CAPITAL_STARTING_PENALTY_PER_PROVINCE = 0.5, -- 补给离开原点时起始惩罚值（受地形等修正）
	CAPITAL_ADDED_PENALTY_PER_PROVINCE = 1.2, -- 每远离原点一个省份额外增加的惩罚

	-- 以下定义用于计算已建节点的补给范围
	NODE_INITIAL_SUPPLY_FLOW = 2.8, -- 已建节点起始补给流量
	NODE_STARTING_PENALTY_PER_PROVINCE = 0.50, -- 同上
	NODE_ADDED_PENALTY_PER_PROVINCE = 0.70, -- 同上

	-- 以下定义用于计算船坞的补给范围
	NAVAL_BASE_INITIAL_SUPPLY_FLOW = 3.3, -- 海军基地起始补给流量
	NAVAL_BASE_STARTING_PENALTY_PER_PROVINCE = 0.84, -- 同上
	NAVAL_BASE_ADDED_PENALTY_PER_PROVINCE = 1.1, -- 同上

	-- 节点流量（省份上限）每级铁路瓶颈等级增加此数值
	NODE_FLOW_BONUS_PER_RAIL_LEVEL = 0.34,

	-- 河流在节点之间传输时视为该等级
	RIVER_RAILWAY_LEVEL = 1,

	-- 以下定义用于浮动港口的补给范围
	FLOATING_HARBOR_INITIAL_SUPPLY_FLOW = 2.6, -- 浮动港口起始补给流量
	FLOATING_HARBOR_STARTING_PENALTY_PER_PROVINCE = 0.8, -- 同上
	FLOATING_HARBOR_ADDED_PENALTY_PER_PROVINCE = 0.8, -- 同上

	FLOATING_HARBOR_BASE_SUPPLY = 15.0, -- 浮动港口提供的基础补给量
	FLOATING_HARBOR_BASE_DURATION = 21, -- 满血浮动港口持续天数
	FLOATING_HARBOR_DURATION_RATIO_AT_MIN_HP = 0.0, -- 当港口耐久降至0时的持续时间倍率

	FLOATING_HARBOR_MIN_DECAY = 0.2, -- 每小时至少减少浮动港口耐久“小时数”
	FLOATING_HARBOR_DECAY_MAX_AIR_BONUS = -0.1, -- 100%友方空优时，每小时减少耐久“小时数”的变化量
	FLOATING_HARBOR_DECAY_MAX_AIR_PENALTY = 0.4, -- 100%敌方空优时，每小时增加耐久“小时数”的变化量
	FLOATING_HARBOR_DECAY_MAX_NAVAL_BONUS = -0.2, -- 100%友方海优时，每小时减少耐久“小时数”的变化量
	FLOATING_HARBOR_DECAY_MAX_NAVAL_PENALTY = 0.5, -- 100%敌方海优时，每小时增加耐久“小时数”的变化量
	FLOATING_HARBOR_DECAY_NO_CONTROL_PENALTY = 1.0, -- 若相邻陆地省份未控制，每小时增加耐久“小时数”的变化量

	SUPPLY_FLOW_DROP_REDUCTION_AT_MAX_INFRA = 0.30, -- 最高基础设施等级可减少补给流量衰减的比例
	SUPPLY_FLOW_PENALTY_CROSSING_RIVERS = 0.20, -- 跨越河流时额外惩罚

	-- 节点补给地形衰减使用逻辑斯蒂曲线基于距离(d)计算（scalar / (1+e^(-k(d-midpoint)))）
	SUPPLY_FLOW_DIST_LOGISTICS_FALLOFF_K = 1.3, -- 曲线陡峭程度
	SUPPLY_FLOW_DIST_LOGISTICS_FALLOFF_MIDPOINT = 2.3, -- 曲线拐点
	SUPPLY_FLOW_DIST_LOGISTICS_FALLOFF_SCALAR = 0.9, -- 距离造成的最大惩罚倍率
	SUPPLY_FLOW_DIST_LOGISTICS_FALLOFF_MIN_PENALTY_SCALE = 0.25, -- 逻辑斯蒂曲线不会将惩罚系数降至该值以下

	-- 完全摩托化枢纽增加的射程奖励。此补给将叠加在上面定义的 XXX_INITIAL_SUPPLY_FLOW 之上。
	SUPPLY_HUB_FULL_MOTORIZATION_BONUS = 2.2,
	-- 完全摩托化枢纽所需的卡车数量
	SUPPLY_HUB_FULL_MOTORIZATION_TRUCK_COST = 60.0,
	-- 每增加一级摩托化（即设置摩托化的国家），下一级的最大奖励减少此值
	SUPPLY_HUB_MOTORIZATION_MARGINAL_EFFECT_DECAY = 1.6,

	-- 用于计算铁路“流量”
	RAILWAY_BASE_FLOW = 10.0, -- 当节点通过铁路连接到首都/海军节点时的基础流量
	RAILWAY_FLOW_PER_LEVEL = 5.0, -- 每级铁路额外提供的流量
	RAILWAY_FLOW_PENALTY_PER_DAMAGED = 5.0, -- 每条受损铁路的流量惩罚
	RAILWAY_MIN_FLOW = 5.0, -- 铁路流量可减少到的最小值

	-- 用于计算通过护航路线连接的两个海军节点之间的“流量”
	-- NAVAL_BASE_MAX_SUPPLY_FLOW_FACTOR = 0.9, -- 父节点的流量按此比例计算（最多转移父海军节点流量*此定义）
	NAVAL_BASE_FLOW = 5.0, -- 海军节点的最大输入/输出受该基础值限制
	NAVAL_FLOW_PER_LEVEL = 3.0, -- 每级海军节点的最大输入/输出额外增加该值

	SUPPLY_NODE_MIN_SUPPLY_THRESHOLD = 1.0, -- 若节点的补给低于此值，则设为0 -- 目前未使用？当发生足够破坏时应触发

	INFRA_TO_SUPPLY = 0.3, -- 每级基础设施提供的补给量
	VP_TO_SUPPLY_BASE = 0.2, -- 无论等级如何，胜利点提供的补给奖励
	VP_TO_SUPPLY_BONUS_CONVERSION = 0.05, -- 胜利点对本地补给的额外奖励，乘以该系数并四舍五入
	SUPPLY_FROM_DAMAGED_INFRA = 0.15, -- 受损基础设施在补给计算中按此比例计算
	SUPPLY_BASE_MULT = 0.2, -- 补给基础值倍率
	SUPPLY_DISRUPTION_DAILY_RECOVERY = 1.5, -- 节点每日恢复的累计中断量

	RAILWAY_CONVERSION_COOLDOWN = 10, -- 铁路被敌方占领后进入冷却，冷却期间不可用
	RAILWAY_CONVERSION_COOLDOWN_CORE = 5,
	RAILWAY_CONVERSION_COOLDOWN_CIVILWAR = 0,

	DEFAULT_STARTING_TRUCK_RATIO = 1.5, -- 国家初始卡车库存相对于需求的倍率
	DEFAULT_STARTING_TRAIN_RATIO = 1, -- 国家初始火车库存相对于需求的倍率

	SUPPLY_POINTS_PER_TRAIN = 1.0,  -- 旧默认值1.25 -- 每列火车可承载的补给量（火车将补给从首都运输到补给节点）
	NUM_RAILWAYS_TRAIN_FACTOR = 0.03, -- 火车使用量按补给节点与首都之间的铁路距离乘以该系数缩放

	BASE_SUPPLY_MULT_FOR_TRUCK_DEFAULT_BUFFER = 1.0, -- 初始卡车使用缓冲比例
	BASE_SUPPLY_MULT_FOR_TRUCK_MIN_BUFFER = 0.0, -- 缓冲比例最小值
	BASE_SUPPLY_MULT_FOR_TRUCK_MAX_BUFFER = 100.0, -- 缓冲比例最大值

	TRUCK_ATTRITION = 0.003, -- 基础卡车损耗
	TRUCK_ATTRITION_FACTOR = 0.65, -- 总卡车损耗的缩放倍率

	BASE_TRUCK_HP = 100.0,
	TRUCK_HP_PER_ARMOR = 2, -- 每点装甲增加的卡车耐久

	BASE_TRAIN_HP = 100.0,
	TRAIN_ARMOR_TARGETING_WEIGHT = 0.01, -- 每点装甲值使敌轰炸机更可能攻击该目标
	TRAIN_ANTI_AIR_HIT_CHANCE = 0.07, -- 平衡值，决定火车防空命中攻击机群的机率
	TRAIN_ANTI_AIR_HIT_ROLL_COUNT = 12, -- 所有被攻击火车的防空值累加，然后进行该次数的随机判定，每次命中概率如上，以确定实际命中的防空值比例
	TRAIN_ANTI_AIR_ATTACK_TO_AMOUNT = 0.001, -- 平衡值，将命中的防空值转换为被击落敌机百分比的转换值

	MIN_TRAIN_SUPPLY_FACTOR = 0.5, -- 库存为0时仅应用此惩罚系数，随需求满足程度线性上升至1.0
	MIN_TRAIN_REQUIREMENT = 2, -- 若总火车需求≤此值，则不施加补给惩罚，即使库存不足

	SUPPLY_FLOW_REDUCTION_THRESHOLD = 0.1, -- 若补给流量低于此值，则不应用

	-- 以下值用于计算潜在卡车使用量
	-- 通常潜力≈当前使用量，但单位在地图上移动时会被分配到不同节点，由于卡车最小需求为1，因此会略微增加使用量
	BASE_AIR_SUPPLY_MULT_FOR_TRUCK_BUFFER = 1.0,
	BASE_ARMY_SUPPLY_MULT_FOR_TRUCK_BUFFER = 1.0,
	BASE_NAVY_SUPPLY_MULT_FOR_TRUCK_BUFFER = 1.0,

	CAPITAL_NODE_BASE_SUPPLY_ADD = 0,
	BUILT_NODE_BASE_SUPPLY_ADD = 0.6,
	LOCAL_NODE_BASE_SUPPLY_ADD = 0.5,
	NAVAL_NODE_BASE_SUPPLY_ADD = 0.3,
	-- ~结束

	-- 若补给流量充足，部队会缓慢积累补给至>100%，最高可达其补给宽限期；否则将根据补给恶劣程度每日损失至100%
	ARMY_SUPPLY_RATIO_STARTING_GAIN = 0.0,
	ARMY_SUPPLY_RATIO_SPEED_GAIN_PER_HOUR = 0.01,
	ARMY_MAX_SUPPLY_RATIO_GAIN_PER_HOUR = 0.15,

	MIN_SURRENDER_LIMIT_TO_MOVE_SUPPLY_CAPITAL = 0.15, -- 国家投降进度需高于此值才能移动首都补给中心
	COOLDOWN_DAYS_AFTER_MOVING_SUPPLY_CAPITAL = 30, -- 上次移动后再次移动补给首都的冷却天数
	DAYS_TO_START_GIVING_SUPPLY_AFTER_MOVING_SUPPLY_CAPITAL = 7,  -- 移动补给首都后，国家将在该天数后开始获得补给
	DAYS_TO_START_GIVING_FULL_SUPPLY_AFTER_MOVING_SUPPLY_CAPITAL = 21, -- 移动补给首都后，国家将在该天数后达到最大补给

	MIN_DIFF_FOR_AUTO_UPDATING_EXISTING_RAILWAYS = 5, -- 修建铁路时，若新铁路与现有铁路足够接近，系统将优先升级现有铁路

	-- 增援时间取决于与首都的距离，以下定义用于计算增援时间
	SUPPLY_PATH_MAX_DISTANCE = 15, -- 最大允许时间
	RAILWAY_DISTANCE_FACTOR_FOR_REINFORCEMENT_SPEED = 0.3, -- 总铁路距离的修正系数
	TRUCK_DISTANCE_FACTOR_FOR_REINFORCEMENT_SPEED = 0.01, -- 总卡车距离的修正系数
	NAVAL_DISTANCE_FACTOR_FOR_REINFORCEMENT_SPEED = 0.08, -- 总海军距离的修正系数

	ALERT_VERY_LOW_SUPPLY_LEVEL = 0.2, -- 触发补给极低警报的阈值（支持补给/需求补给的百分比）
	ALERT_LOW_SUPPLY_LEVEL = 0.5, -- 触发补给低警报的阈值

	AI_FRONT_MINIMUM_UNITS_PER_PROVINCE_FOR_SUPPLY_CALCULATIONS = 1, -- AI在评估补给限制时，每个省份最少保留的师数量
	AI_FRONT_DIVISIONS_PER_SUPPLY_POINT = 1.0, -- AI认为每个可用补给点可维持的师数量
	AI_FRONT_MAX_UNITS_ENEMY_COUNT_FACTOR = 1.2, -- 确保AI前线最大单位数至少为敌军的该倍数
	SUPPLY_THRESHOLD_FOR_ARMY_ATTRITION = 0.35, -- 部队补给低于此值时才会遭受损耗
	NUMBER_OF_SHOWN_SUPPLY_SOURCES_IN_SUPPLY_MAPMODE = 3, -- 补给地图模式中补给来源明细显示数量
	ESTIMATED_DIVISION_WEIGHT_FOR_SUPPLY_ESTIMATIONS_GUI = 1.0, -- 用于命令提示中估计前线权重的师补给消耗值
	AVAILABLE_MANPOWER_STATE_SUPPLY = 0.18, -- 州补给中来自最大人力（人口）的系数
	NON_CORE_MANPOWER_STATE_SUPPLY = 0.2, -- 占领者控制时州补给中来自人口的系数（不掠夺粮食）
	STORED_SUPPLY_CONSUMPTION_RATE_FACTOR = 0.75, -- 存储补给消耗速率的倍率（更多/更少缓解）
},