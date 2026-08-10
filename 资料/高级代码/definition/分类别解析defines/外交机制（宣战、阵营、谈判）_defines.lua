NDiplomacy = {
	DIPLOMACY_REQUEST_EXPIRY_DAYS = 30,
	BASE_SURRENDER_LEVEL = 1.0,						-- Surrender when level reached. valid 0-1
	MAX_TRUST_VALUE = 100,							-- Max trust value cap.
	MIN_TRUST_VALUE = -100,							-- Min trust value cap.
	MAX_OPINION_VALUE = 100,						-- Max opinion value cap.
	MIN_OPINION_VALUE = -100,						-- Min opinion value cap.
	BASE_TRUCE_PERIOD = 180,						-- Base truce period in days.
	TRUCE_PERIOD_AFTER_KICKING_FROM_FACTION = 60,				-- Truce period after kicking someone from faction in days.
	NUM_DAYS_TO_ENABLE_KICKING_NEW_MEMBERS_OF_FACTION = 90,			-- Number of days before being able to kick a new member of faction
	NUM_DAYS_TO_ENABLE_REINVITE_KICKED_NATIONS = 90,			-- Number of days before being able to re invite a kicked nation to your faction
	BASE_NEGATIVE_OPINION_AFTER_BEING_KICKED = 20,				-- Negative opinion that will be received after kicking a nation
	DECAY_RATE_OF_NEGATIVE_OPINION_AFTER_BEING_KICKED = 1,			-- Weekly decay rate of the negative opinion
	TRUCE_BREAK_COST_PP = 200,						-- Base cost in PP of breaking a truce by joining a war or accepting a call to war ( you cannot declare war yourself until the truce if up ), this is then multiplied by the time left on the truce ( so once half the truce is up it only cost 50% of this )
	BASE_PEACE_PUPPET_FACTOR = 100,					-- Base factor for puppet in %.
	BASE_PEACE_LIBERATE_FACTOR = 100,				-- Base factor for liberate in %.
	BASE_PEACE_TAKE_UNCONTROLLED_STATE_FACTOR = 10.0, -- Base factor for taking state you do not control
	BASE_PEACE_TAKE_FACTION_CONTROLLED_STATE_FACTOR = 0.5, -- Base factor for taking state you do not control, but someone in faction does
	BASE_PEACE_FORCE_GOVERNMENT_COST = 100, 		-- Base cost for forcing a country to change government.
	-- In peace conference, cost is factored based on how many times the state has been contested and for how long it has been uncontested (for everyone else)
	PEACE_COST_FACTOR_CONTESTED_MAX = 15,           -- To prevent overflows due to the exponential increase, cap the contested factor to this
	PEACE_COST_FACTOR_UNCONTESTED_MAX = 15,         -- To prevent overflows due to the exponential increase, cap the uncontested factor to this
	PEACE_COST_FACTOR_CONTESTED_BID = 1.20,         -- Cost factor for each contested bid on the state.
	PEACE_COST_FACTOR_UNCONTESTED_BID_MIN = 1.15,   -- Minimum cost factor for each turn a bid has been uncontested on the state.
	PEACE_COST_FACTOR_UNCONTESTED_BID_MAX = 1.60,   -- Maximum cost factor for each turn a bid has been uncontested on the state.
	PEACE_COST_FACTOR_UNCONTESTED_BID_STEP = 0.15,  -- Uncontested cost factor will increase by this much each turn.
	PEACE_COST_FACTOR_CAPITAL_SHIP_IC = 0.005,				-- In peace conference, cost for taking one capital ship per IC
	PEACE_COST_FACTOR_SCREENING_SHIP_IC = 0.005,			-- In peace conference, cost for taking a part of the screening ships per IC
	PEACE_INCREASE_COST_FACTOR_PER_MISSING_PERCENT_FOR_CAPITULATION = 0.0012, 	-- increase factor if loser has not capitulated, for every percent between surrender level and BASE_SURRENDER_LEVEL
	-- peace action taker has a discount if they occupy the state depending on compliance
	-- it's a table where first value is the compliance level, and the second the factor
	PEACE_COST_FACTOR_COMPLIANCE_STEPS = {
		0,   1.0, -- between 0%  and 30% compliance, factor is 1.0
		30,  0.9, -- between 30% and 70%
		70,  0.8, -- above 70%
	},
	-- In peace conference, adding a stackable to a peace action, increment the cost by a percentage
	PEACE_COST_FACTOR_STACK_DEMILITARIZED_ZONE = 0.25,
	PEACE_COST_FACTOR_STACK_WAR_REPARATION = 0.25,
	PEACE_COST_FACTOR_STACK_RESOURCE_RIGHTS = 0.25,
	PEACE_COST_FACTOR_STACK_DISMANTLE_INDUSTRY = 0.25,
	-- peace conference can set timed effect, set length in days
	PEACE_TIMED_EFFECT_LENGTH_DEMILITARIZED_ZONE = 1825, -- 5 years
	PEACE_TIMED_EFFECT_LENGTH_WAR_REPARATION = 1825,
	PEACE_TIMED_EFFECT_LENGTH_RESOURCE_RIGHTS = 1825,
	PEACE_TIMED_EFFECT_RATIO_CIVILIAN_FACTORY_WAR_REPARATION = 0.5, 	-- ratio of civilian factories taken via stackable war reparation

	-- The Influence cost modifier is basically the inverse of distance. Nearby states are cheaper, and far-away states are more expensive.
	-- We basically do a two-segment lerp:
	--   if distance is between [0, NEUTRAL_DIST], we lerp the cost modifier between [MIN_DIST_COST_MODIFIER, 1.0]
	--   if distance is between [NEUTRAL_DIST, MAX_DIST], we lerp the cost modifier between [1.0, MAX_DIST_COST_MODIFIER]
	-- The below values represent (pixel distance / INFLUENCE_DISTANCE_DIVISOR)
	INFLUENCE_NEUTRAL_DIST_CAPITAL = 30.0,           -- distance to capital that results in a cost modifier of 1.0
	INFLUENCE_MAX_DIST_CAPITAL = 45.0,              -- distance to capital that results in a cost modifier of INFLUENCE_MAX_DIST_COST_MODIFIER
	INFLUENCE_NEUTRAL_DIST_CORE = 6.0,              -- distance to nearest core state that results in a cost modifier of 1.0
	INFLUENCE_MAX_DIST_CORE = 13.0,                 -- distance to nearest core state that results in a cost modifier of INFLUENCE_MAX_DIST_COST_MODIFIER
	INFLUENCE_NEUTRAL_DIST_CONTROLLED = 14.0,       -- distance to nearest controlled state that results in a cost modifier of 1.0
	INFLUENCE_MAX_DIST_CONTROLLED = 20.0,           -- distance to nearest controlled state that results in a cost modifier of INFLUENCE_MAX_DIST_COST_MODIFIER
	INFLUENCE_MIN_DIST_COST_MODIFIER = 0.70,        -- Cost modifier at min (zero) distance
	INFLUENCE_MAX_DIST_COST_MODIFIER = 1.00,         -- Cost modifier at max distance
	INFLUENCE_RATIO_CAPITAL = 0.05,                  -- Ratio of influence based on distance to capital
	INFLUENCE_RATIO_CORE = 0.45,                     -- Ratio of influence based on distance to nearest core territory
	INFLUENCE_RATIO_CONTROLLED = 0.5,               -- Ratio of influence based on distance to neared controlled territory (including uncontested peace conference bids)
	INFLUENCE_DISTANCE_DIVISOR = 22.0,              -- Divide pixel distance with this when determining distance to capital / core / controlled states. Just an arbitrary way of scaling the distance numbers.

	INFLUENCE_PER_ADJACENCY = 0.05,					-- How much influence to add per uncontested adjacent state in the PC (blob, don't snake)

	INFLUENCE_MAJOR_FACTOR = 1.0,					--How much influence discount an AI major will get (inverse)
	INFLUENCE_MINOR_FACTOR = 1.0,					--How much influence discount an AI minor will get (inverse)

	PEACE_TRIGGER_AI_MAX_INFLUENCE_VALUE = 0.99,	-- Max influence value for pc_is_state_outside_influence_for_winner trigger

	BASE_IMPROVE_RELATION_COST = 10,                -- Political power cost to initiate relation improvement
	BASE_IMPROVE_RELATION_SAME_IDEOLOGY_GROUP_MAINTAIN_COST = 0.2, -- Political power cost each update when boosting relations with nation of same ideology
	BASE_IMPROVE_RELATION_DIFFERENT_IDEOLOGY_GROUP_MAINTAIN_COST = 0.4,    -- Political power cost each update when boosting relations with nation of different ideology
	BASE_SEND_ATTACHE_COST = 100,					-- Political power cost to send attache
	BASE_SEND_ATTACHE_CP_COST = 50.0,				-- Command Power sent attache usage cost
	BASE_GENERATE_WARGOAL_DAILY_PP = 0.2,	-- Daily pp cost for generation of wargoals
	WARGOAL_VERSUS_MAJOR_AT_WAR_REDUCTION = -0.75, 	-- reduction of pp cost for wargoal vs major at war.
	WARGOAL_WORLD_TENSION_REDUCTION = -0.5,			-- Reduction of pp cost for wargoal at 100% world tension, scales linearly
	WARGOAL_JUSTIFY_TENSION_FROM_PRODUCTION = 30.0,	-- Base value scaled by production capacity of country compared to biggest country
	MIN_WARGOAL_JUSTIFY_COST = 2.0,					-- It always takes atleast 10 days to justify a wargoal
	WARGOAL_PER_JUSTIFY_AND_WAR_COST_FACTOR = 1.5,	-- Cost factor per nation at war with or justifying against
	WARGOAL_THREAT_MAX_TIME_RATIO = 1.0,			-- Threat from justifying a wargoal slowly builds up, hitting 100% at this proportion of the way to completion
	BASE_BOOST_PARTY_POPULARITY_DAILY_PP = 0.25, 	-- Daily pp cost for boost party popularity
	BASE_BOOST_PARTY_POPULARITY_DAILY_DRIFT = 0.1, 	-- Daily amount of popularity that will be added by the activity.
	BASE_STAGE_COUP_DAILY_PP = 0.5,					-- Daily pp cost for staging a coup
	BASE_STAGE_COUP_TOTAL_COST = 200, 				-- Equipment consume factor for stage coup.
	NAP_EXPIRY_MONTHS = 48,                         -- NAPs expire after this many months
	NAP_UNBREAKABLE_MONTHS = 12,                    -- NAPS cannot be broken for this many months
	NAP_FORCE_BALANCE_RULE_MONTHS = 6,        		-- The NAP border force balance rule changes with this interval
	NAP_BREAK_FORCE_BALANCE_1 = 2.0,              	-- 2-1 brigades along the border required to break NAP
	NAP_BREAK_FORCE_BALANCE_2 = 1.0,              	-- 1-1 brigades along the border required to break NAP
	NAP_BREAK_FORCE_BALANCE_3 = 0.5,              	-- 1-2 brigades along the border required to break NAP
	VERY_GOOD_OPINION = 50,							-- Threshold for a country that has a very good opinion of you.
	VERY_BAD_OPINION = -50,							-- Threshold for a country that has a very bad opinion of you.
	DIPLOMACY_HOURS_BETWEEN_REQUESTS = 24,			-- How long a country must wait before sending a new diplomatic request.
	TROOP_FEAR = 1, 								-- Impact on troops on borders when deciding how willing a nation is to trade
	FLEET_FEAR = 1,									-- Impact on troops on borders when deciding how willing a nation is to trade
	IC_TO_EQUIPMENT_COUP_RATIO = 0.1,				-- Ratio for calculating cost of staging coup
	VOLUNTEERS_PER_TARGET_PROVINCE = 0.05,			-- Each province owned by the target country contributes this amount of volunteers to the limit.
	VOLUNTEERS_PER_COUNTRY_ARMY = 0.05,				-- Each army unit owned by the source country contributes this amount of volunteers to the limit.
	VOLUNTEERS_RETURN_EQUIPMENT = 0.95,				-- Returning volunteers keep this much equipment
	VOLUNTEERS_TRANSFER_SPEED = 14,					-- days to transfer a unit to another nation
	VOLUNTEERS_DIVISIONS_REQUIRED = 30,				-- This many divisons are required for the country to be able to send volunteers.
	TENSION_STATE_VALUE = 2,						-- Tension value gained by annexing one state
	TENSION_CIVIL_WAR_IMPACT = 0.2,					-- civil war multiplier on tension.
	TENSION_NO_CB_WAR = 10,							-- Amount of tension generated by a no-CB wargoal
	TENSION_CB_WAR = 7,								-- Amount of tension generated by a war with a CB
	TENSION_ANNEX_NO_CLAIM = 2,						-- Amount of tension generated by annexing a state you don't have claims on
	TENSION_ANNEX_CLAIM = 0.5,						-- Amount of tension generated by annexing a state you DO have claims on
	TENSION_ANNEX_CORE = 0,							-- Amount of tension generated by annexing a state that is your core
	TENSION_PUPPET = 1.25,							-- Amount of tension generated by puppeting (per state)
	TENSION_FORCE_GOVERNMENT = 0.75,                -- Amount of tension generated by forcing government (per state)
	TENSION_VOLUNTEER_FORCE_DIVISION = 0.2,			-- Amount of tension generated for each sent division
	TENSION_DECAY_DAILY = 0.005,					-- Each day tension decays this much for Threat sources which are no longer relevant. Replaces TENSION_DECAY as of 1.12.0
	TENSION_SIZE_FACTOR = 1.0,						-- All action tension values are multiplied by this value
	TENSION_TIME_SCALE_START_DATE = "1936.1.1.12",	-- Starting at this date, the tension values will be scaled down (will be equal to 1 before that)
	TENSION_TIME_SCALE_MONTHLY_FACTOR = -0.005,		-- Timed tension scale will be modified by this amount starting with TENSION_TIME_SCALE_START_DATE
	TENSION_TIME_SCALE_MIN = 0.25,					-- Timed tension scale won't decrease under this value
	TENSION_GUARANTEE = -5,
	TENSION_FACTION_JOIN = 4,
	TENSION_JOIN_ATTACKER = 2,						-- scale of the amount of tension added when country joins attacker side
	TENSION_PEACE_FACTOR = 0.25,					-- scale of the amount of tension (from war declaration) reduced when peace is completed.
	TENSION_LIBERATE = -1,							-- Amount of tension generated by liberating a country.
	TENSION_TAKE_ONE_CAPITAL_SHIP = 0.25,			-- Amount of tension generated by 1 take navy peace action
	TENSION_DEMILITARIZE_ZONE = 0.25,				-- Amount of tension generated by stacking demilitarize zone on 1 state, multiplied with the state base threat
	TENSION_WAR_REPARATION = 0.25,					-- Amount of tension generated by stacking war reparation on 1 state, multiplied with the state base threat
	TENSION_RESOURCE_RIGHTS = 0.25,					-- Amount of tension generated by stacking resource rights on 1 state, multiplied with the state base threat
	TENSION_DISMANTLE_INDUSTRY = 0.25,				-- Amount of tension generated by stacking dismantle military industry on 1 state, multiplied with the state base threat
	TENSION_CAPITULATE = 0.40,						-- Scale of the amount of tension created by a countries capitulation.
	GUARANTEE_COST = 25,							-- Scale with the number of already guaranteed countries.
	REVOKE_GUARANTEE_COST = 25,
	BASE_CONDITIONAL_PEACE_WARESCORE_RATIO = 0.5, 	-- Warscore ratio needed for the losing side to able to surrender.
	BASE_CONDITIONAL_PEACE_MONTHS = 3,				-- War length must be before a surrender is possible.
	JOINING_NAP_WAR_PENALTY = 0.2,					-- War support penalty for breaking non-breakable NAP
	BREAKING_GUARANTEE_PENALTY = 0.2,				-- War support penalty for breaking guarantee

	-- WARNING ! if you modify the following values, you should update corresponding loc keys in games_rules_l_english.yml
	PEACE_SCORE_TRANSFERRED_TO_FACTION_LEADER = 0.1, 		-- Part of the peace score transferred from the faction members to the faction leader (if game rule enabled)
	PEACE_SCORE_RESET_LOW_SCORE_THRESHOLD = 0.05,			-- Winners with less than this ratio of war participation will give all their score to other players
	PEACE_SCORE_RESET_LOW_SCORE_MINIMUM_FOR_RECEIVER = 0.1, -- Disable the previous, if no winner has at least this ratio of war participation

	PEACE_SCORE_SCALE_FACTOR = 1.35,                -- Losers' total value times this factor becomes the default total peace conference score that is distributed to the winners.

	PEACE_SCORE_MINOR_BOOST_FRACTION = 0.05,        -- Low-scoring winners are boosted by receiving more of their score earlier. This value, multiplied by the total score distributed this turn, is the minimum score they will receive (up until their total allocated score).
	-- Example: If 2000 score is distributed to winners this turn and this value is set to 0.05, each winner will receive a minimum of 100 score (clamped by the max score they will receive over the cource of the conference).

	PEACE_SCORE_DISTRIBUTION = { 0.2, 0.2, 0.2, 0.2, 0.2 }, -- How much of the total peace conference score you get during the first n turns.
	-- More explanation of the peace score distribution above:
	-- {1.0} would give you all the score on the first turn.
	-- {0.5, 0.5, 0.5} would give you 50 % of the total score on each of the first three turns (in this case resulting in receiving 150 % of the total score).

	PEACE_CONTEST_REFUND_FACTOR = { 1.0, 0.92, 0.84, 0.76 }, -- How much of the spent peace conference score that gets refunded in a contest. First element applies for the first round of conflicts, second element for the second round of conflicts, etc. The final element is used for each consecutive turn, so setting that to e.g. 0.7 means you get 70 % of the spent score back for every turn thereafter.

	PEACE_PLAY_SOUND_ON_NEW_TURN = true,            -- Whether the 'peace_conference_new_turn' audio hook is called or not
	PEACE_PLAY_NEW_TURN_SOUND_ONLY_IF_NOT_ALREADY_PLAYING = true, -- Whether the 'peace_conference_new_turn' audio hook should play only if not already playing (relevant if players spam-click the pass/submit button)

	MAX_REMEMBERED_LEASED_IC = 1000,				-- Maximum of leased equipment value that is remembered for opinion bonus
	MAX_OPINION_FOR_LEASED_IC = 30,					-- Positive opinion when remembering the MAX_REMEMBERED_LEASED_IC equipment
	MONTHLY_LEASED_IC_DECAY = 35,					-- How much of leased equipment is being "forgot" each month
	OPINION_PER_VOLUNTEER = 3,						-- Opinion bonus per one sent volunteer division
	MAX_OPINION_FROM_VOLUNTEERS = 30,				-- Opinion bonus per one sent volunteer division
	OPINION_FOR_DEMO_FROM_WT_GENERATION = -2.0,		-- How much less do democracies like us if we generate world tension
	NOT_READY_FOR_WAR_BASE = -50,					-- AI should be unwilling to enter accept a call to war if not ready for war against the relevant enemies.
	FRONT_IS_DANGEROUS = -100,						-- AI should be unwilling to enter accept a call to war if front is too dangerous.
	NOT_READY_FOR_WAR_VAL_PER_DAY_SINCE_CALL = 1,	-- Value modifying the not ready base over time.

	PEACE_ACTION_MAX_COST = 9999,					-- Max value for a peace action cost (after all modifiers)

	RESOURCE_SENT_AUTONOMY_DAILY_BASE = 0.0,		-- If puppet provides resources to its master they increasy their autonomy by at least this amount
	RESOURCE_SENT_AUTONOMY_DAILY_FACTOR = 0.005,	-- If puppet provides resources to its master they increasy their autonomy by the resources factored by this
	WAR_SCORE_AUTONOMY_BASE = 0.0,					-- Value added if any war score is contributed by puppet
	WAR_SCORE_AUTONOMY_FACTOR = 0.6,				-- If puppet generates war score it get a boost to independence
	LL_TO_OVERLORD_AUTONOMY_DAILY_BASE = 0.0,		-- If puppet lend leases equipment to overlord of at least same tech level as they have, they gain autonomy
	LL_TO_OVERLORD_AUTONOMY_DAILY_FACTOR = 0.05,	-- If puppet lend leases equipment to overlord of at least same tech level as they have, they gain autonomy
	LL_TO_PUPPET_AUTONOMY_DAILY_BASE = 0.0,			-- If overlord lend leases equipment to puppet of higher tech level as they have, puppet losses autonomy
	LL_TO_PUPPET_AUTONOMY_DAILY_FACTOR = -0.01,		-- If overlord lend leases equipment to puppet of higher tech level as they have, puppet losses autonomy
	AUTONOMY_FREEDOM_FROM_CAPITULATE = 0.5,         -- if overlord capitulate you get this
	ATTACHE_TO_SUBJECT_EFFECT = -0.05,				-- If overlord sent attaches to the subject it losses autonomy
	ATTACHE_TO_OVERLORD_EFFECT = 0.05,				-- If subject sent attaches to the overlord it gains autonomy

	AUTONOMY_LEVEL_CHANGE_SANCTUARY = 30,			-- The number of days post autonomy level has changed where neither side can increase nor decrease the autonomy level.
	AUTONOMY_LEVEL_CHANGE_PP_COST_BASE = 50.0,		-- Base cost of changing level of autonomy
	AUTONOMY_LEVEL_CHANGE_PP_ANNEX = 300,			-- Annexation cost
	AUTONOMY_LEVEL_CHANGE_PP_FREE = 300,			-- Break free cost
	MAX_SCORE_DIFF_TO_CHANGE_AUTONOMY = 10,			-- The max diff between current freedom score and the cap for next or previous level allowed for changing
	MASTER_BUILD_AUTONOMY_FACTOR = -0.7,            -- scales autonomy gain from construction by this
	VICTORY_POINT_WORTH_FACTOR = 10,				-- multiplier when calcualting province worth (surrender)
	VICTORY_POINT_WORTH_FACTOR_WARSCORE = 0.2,				-- multiplier for each victory points when calculating province worth for warscore
	PROVINCE_WORTH_FROM_STATE_VALUE_FACTOR_WARSCORE = 0.2, 	-- multiplier for the average value a province received from state for warscore
	CAPITAL_CAPITULATE_BONUS_SCORE = 150,			-- extra bonus when deciding who to capitulate to (applied to capital holder)
	CAPITAL_CAPITULATE_BONUS_SCORE_MUL = 1.5,		-- extra bonus multiplier when deciding who to capitulate to (applied to capital holder)
	IDEOLOGY_JOIN_FACTION_MIN_LEVEL = 0.3,			-- ideology limit required to join faction
	JOIN_FACTION_LIMIT_CHANGE_AT_WAR = 0.5,			-- if in defensive war this or your modifier is counted as limit to join factions (so if you have 80% join limit this now means you can join at 50%)
	LICENSE_ACCEPTANCE_OPINION_FACTOR = 0.4,		-- Opinion modifier for acceptance of license production requests.
	LICENSE_ACCEPTANCE_PUPPET_BASE = 15,			-- Acceptance modifier for puppets requesting production licenses.
	LICENSE_ACCEPTANCE_TECH_DIFFERENCE = 2, 		-- Acceptance modifier for each year of technology difference.
	LICENSE_ACCEPTANCE_TECH_DIFFERENCE_BASE = 10,    -- Acceptance base for tech difference
	LICENSE_ACCEPTANCE_SAME_FACTION = 20,			-- Acceptance modifier for being in the same faction

	WARGOAL_COST_LEND_LEASE = -0.25,                -- cost modifier to wargoaljustification for LL
	WARGOAL_COST_DOCKING_RIGHTS = -0.2,             -- cost modifier to wargoaljustification for dockign rights
 	WARGOAL_COST_VOLUNTEERS = -0.5,                 -- cost modifier to wargoaljustification for volunteers

	ASSUME_FACTION_LEADERSHIP_PP_COST = 200,				-- Political power cost to assume faction leadership
	ASSUME_FACTION_LEADERSHIP_MIN_MANPOWER_RATIO = 2,		-- The minimum ratio of manpower that a country must have compared to the current leader in order to assume leadership.
	ASSUME_FACTION_LEADERSHIP_MIN_FACTORY_RATIO = 1.5,		-- The minimum ratio of factories that a country must have compared to the current leader in order to assume leadership.
	ASSUME_FACTION_LEADERSHIP_COOLDOWN_DAYS = 180,			-- Number of days after formation of faction or change in leadership before another country is allowed to assume leadership.
	ASSUME_FACTION_SPYMASTER_COOLDOWN_DAYS = 180,			-- Number of days after change of Spy Master before another country is allowed to become Spy Master.
	FACTION_LEADERSHIP_CHANGE_ALERT_THRESHOLD = 0.8,		-- Threshold for showing an alert when a faction member is close to being able to assume leadership of the faction that a player currently leads.
	FACTION_LEADERSHIP_CHANGE_NOT_SUBJECT_WEIGHT = 2,		-- Importance of subject status when determining how close a faction member is to being able to assume leadership.
	FACTION_LEADERSHIP_CHANGE_NOT_CAPITULATED_WEIGHT = 2,	-- Importance of capitulation status when determining how close a faction member is to being able to assume leadership.
	FACTION_LEADERSHIP_CHANGE_IN_ALL_WARS_WEIGHT = 1,		-- Importance not being in all faction leader wars when determining how close a faction member is to being able to assume leadership.
	FACTION_LEADERSHIP_CHANGE_COOLDOWN_WEIGHT = 1,			-- Importance of leadership change cooldown when determining how close a faction member is to being able to assume leadership.
	FACTION_LEADERSHIP_CHANGE_MANPOWER_WEIGHT = 2,			-- Importance of manpower in field when determining how close a faction member is to being able to assume leadership.
	FACTION_LEADERSHIP_CHANGE_FACTORY_WEIGHT = 2,			-- Importance of factory count when determining how close a faction member is to being able to assume leadership.

	EMBARGO_COST = 100,										-- One-time cost
	REVOKE_EMBARGO_COST = 0,								-- Cost to remove an existing embargo
	EMBARGO_THREAT_THRESHOLD = 30,						-- Target-generated threat threshold to allow embargo (affected by modifiers)

	EMBARGO_SAME_IDEOLOGY_AI_WEIGHT = -20,				-- AI weight for same ideology
	EMBARGO_DIFFERENT_IDEOLOGY_AI_WEIGHT = 15,			-- AI weight for different ideology
	EMBARGO_DIFFERENT_IDEOLOGY_AT_OFFENSIVE_WAR_AI_WEIGHT = 10,	--AI weight for different ideology and in offensive war (additive with above)
	EMBARGO_RECIPIENT_IS_MAJOR_AI_WEIGHT = 10,			-- Ai weight for recipient being major
	EMBARGO_NEIGHBOUR_AI_WEIGHT = -10,					--AI weight for embargoing neighbors (neighbors are big and scary, we should consider not doing it)

	EQUIPMENT_PURCHASE_ACCEPTANCE_OPINION = 1.1,                        -- Acceptance factor for opinion
	EQUIPMENT_PURCHASE_ACCEPTANCE_SAME_IDEOLOGY = 15,                   -- Acceptance value added if same ideology
	EQUIPMENT_PURCHASE_ACCEPTANCE_SCRIPTED_IDEOLOGY_ACCEPTANCE = 1.0,   -- Acceptance factor for scripted ideology acceptance modifier
	EQUIPMENT_PURCHASE_ACCEPTANCE_TRADE_INFLUENCE = 0.70,               -- Acceptance factor for trade influence (adjusted from base value)
	EQUIPMENT_PURCHASE_ACCEPTANCE_COMPETING_FACTIONS = -30,             -- Acceptance value added if both countries are in factions, and factions are different
	EQUIPMENT_PURCHASE_ACCEPTANCE_EMBARGO = -200,                       -- Acceptance value added if either side has embargoed the other
	EQUIPMENT_PURCHASE_ACCEPTANCE_NON_AGGRESSION_PACT = 25,             -- Acceptance value added if there is a non-aggression pact between the countries

	MARKET_ACCESS_ACCEPTANCE_OPINION = 1.1,                             -- Acceptance factor for opinion
	MARKET_ACCESS_ACCEPTANCE_SAME_IDEOLOGY = 15,                        -- Acceptance value added if same ideology
	MARKET_ACCESS_ACCEPTANCE_SCRIPTED_IDEOLOGY_ACCEPTANCE = 1.0,        -- Acceptance factor for scripted ideology acceptance modifier
	MARKET_ACCESS_ACCEPTANCE_TRADE_INFLUENCE = 0.70,                    -- Acceptance factor for trade influence (adjusted from base value)
	MARKET_ACCESS_ACCEPTANCE_COMPETING_FACTIONS = -30,                  -- Acceptance value added if both countries are in factions, and factions are different
	MARKET_ACCESS_ACCEPTANCE_EMBARGO = -200,                            -- Acceptance value added if either side has embargoed the other
	MARKET_ACCESS_ACCEPTANCE_NO_TRADE_ROUTE = -100,                     -- Acceptance value added if there is no valid trade route between the countries
	MARKET_ACCESS_ACCEPTANCE_NON_AGGRESSION_PACT = 25,                  -- Acceptance value added if there is a non-aggression pact between the countries
},

NDiplomacy = {
	DIPLOMACY_REQUEST_EXPIRY_DAYS = 30,  -- 外交请求过期天数
	BASE_SURRENDER_LEVEL = 1.0,  -- 投降阈值，达到此值即投降（有效范围 0–1）
	MAX_TRUST_VALUE = 100,  -- 信任值上限
	MIN_TRUST_VALUE = -100,  -- 信任值下限
	MAX_OPINION_VALUE = 100,  -- 关系上限
	MIN_OPINION_VALUE = -100,  -- 关系下限
	BASE_TRUCE_PERIOD = 180,  -- 基础停战期，单位为天
	TRUCE_PERIOD_AFTER_KICKING_FROM_FACTION = 60,  -- 将某国踢出阵营后的停战期，单位为天
	NUM_DAYS_TO_ENABLE_KICKING_NEW_MEMBERS_OF_FACTION = 90,  -- 新成员加入阵营后需等待多少天方可踢出
	NUM_DAYS_TO_ENABLE_REINVITE_KICKED_NATIONS = 90,  -- 被踢出阵营后需等待多少天方可再次邀请
	BASE_NEGATIVE_OPINION_AFTER_BEING_KICKED = 20,  -- 被踢出阵营后获得的基础负面关系修正
	DECAY_RATE_OF_NEGATIVE_OPINION_AFTER_BEING_KICKED = 1,  -- 被踢后负面关系每周衰减值
	TRUCE_BREAK_COST_PP = 200,  -- 撕毁停战协定的基础政治点数花费；如仍有剩余停战期，则按剩余比例递增
	BASE_PEACE_PUPPET_FACTOR = 100,  -- 傀儡国家在和谈中的基础分数倍率（百分比）
	BASE_PEACE_LIBERATE_FACTOR = 100,  -- 解放国家在和谈中的基础分数倍率（百分比）
	BASE_PEACE_TAKE_UNCONTROLLED_STATE_FACTOR = 10.0,  -- 占领非己方控制地区的基础分数倍率
	BASE_PEACE_TAKE_FACTION_CONTROLLED_STATE_FACTOR = 0.5,  -- 占领己方阵营控制地区的基础分数倍率
	BASE_PEACE_FORCE_GOVERNMENT_COST = 100,  -- 强制改变政体的基础分数花费
	-- 和谈会议：成本根据地区被争夺次数及未被争夺时长动态调整
	PEACE_COST_FACTOR_CONTESTED_MAX = 15,  -- 为防止指数爆炸，对“被争夺”倍率设定上限
	PEACE_COST_FACTOR_UNCONTESTED_MAX = 15,  -- 为防止指数爆炸，对“未被争夺”倍率设定上限
	PEACE_COST_FACTOR_CONTESTED_BID = 1.20,  -- 每多一次争夺，该地区的分数倍率
	PEACE_COST_FACTOR_UNCONTESTED_BID_MIN = 1.15,  -- 未被争夺轮次的最小倍率
	PEACE_COST_FACTOR_UNCONTESTED_BID_MAX = 1.60,  -- 未被争夺轮次的最大倍率
	PEACE_COST_FACTOR_UNCONTESTED_BID_STEP = 0.15,  -- 每回合未被争夺，倍率增加量
	PEACE_COST_FACTOR_CAPITAL_SHIP_IC = 0.005,  -- 和谈中每 IC 主力舰的分数成本
	PEACE_COST_FACTOR_SCREENING_SHIP_IC = 0.005,  -- 和谈中每 IC 护航舰的分数成本
	PEACE_INCREASE_COST_FACTOR_PER_MISSING_PERCENT_FOR_CAPITULATION = 0.0012,  -- 若战败国未投降，每差 1% 投降进度，成本额外增加此比例
	-- 占领者若已控制该地区，则根据顺从度获得折扣
	-- 表内格式：顺从度阈值，折扣倍率
	PEACE_COST_FACTOR_COMPLIANCE_STEPS = {
		0,   1.0,  -- 顺从度 0–30%，倍率 1.0
		30,  0.9,  -- 顺从度 30–70%，倍率 0.9
		70,  0.8,  -- 顺从度 >70%，倍率 0.8
	},
	-- 和谈时可附加的“可堆叠”条款，每项均按比例增加成本
	PEACE_COST_FACTOR_STACK_DEMILITARIZED_ZONE = 0.25,  -- 非军事区附加成本比例
	PEACE_COST_FACTOR_STACK_WAR_REPARATION = 0.25,      -- 战争赔款附加成本比例
	PEACE_COST_FACTOR_STACK_RESOURCE_RIGHTS = 0.25,     -- 资源权利附加成本比例
	PEACE_COST_FACTOR_STACK_DISMANTLE_INDUSTRY = 0.25,  -- 拆除工业附加成本比例
	-- 和谈可设置“限时效果”，以下为持续天数
	PEACE_TIMED_EFFECT_LENGTH_DEMILITARIZED_ZONE = 1825,  -- 非军事区：5 年
	PEACE_TIMED_EFFECT_LENGTH_WAR_REPARATION = 1825,      -- 战争赔款：5 年
	PEACE_TIMED_EFFECT_LENGTH_RESOURCE_RIGHTS = 1825,     -- 资源权利：5 年
	PEACE_TIMED_EFFECT_RATIO_CIVILIAN_FACTORY_WAR_REPARATION = 0.5,  -- 通过战争赔款条款可拿走的民用工厂比例

	-- 影响力成本修正：距离越近越便宜，越远越贵
	-- 采用两段线性插值：
	--   若距离在 [0, NEUTRAL_DIST] 区间，成本倍率在 [MIN_DIST_COST_MODIFIER, 1.0] 之间线性插值
	--   若距离在 [NEUTRAL_DIST, MAX_DIST] 区间，成本倍率在 [1.0, MAX_DIST_COST_MODIFIER] 之间线性插值
	-- 下述数值为“像素距离 / INFLUENCE_DISTANCE_DIVISOR”
	INFLUENCE_NEUTRAL_DIST_CAPITAL = 30.0,  -- 到首都距离等于此值时，成本倍率为 1.0
	INFLUENCE_MAX_DIST_CAPITAL = 45.0,      -- 到首都距离等于此值时，成本倍率为 INFLUENCE_MAX_DIST_COST_MODIFIER
	INFLUENCE_NEUTRAL_DIST_CORE = 6.0,      -- 到最近核心州距离等于此值时，成本倍率为 1.0
	INFLUENCE_MAX_DIST_CORE = 13.0,         -- 到最近核心州距离等于此值时，成本倍率为 INFLUENCE_MAX_DIST_COST_MODIFIER
	INFLUENCE_NEUTRAL_DIST_CONTROLLED = 14.0,  -- 到最近已控制州距离等于此值时，成本倍率为 1.0
	INFLUENCE_MAX_DIST_CONTROLLED = 20.0,      -- 到最近已控制州距离等于此值时，成本倍率为 INFLUENCE_MAX_DIST_COST_MODIFIER
	INFLUENCE_MIN_DIST_COST_MODIFIER = 0.70,   -- 零距离时的成本倍率
	INFLUENCE_MAX_DIST_COST_MODIFIER = 1.00,   -- 最大距离时的成本倍率
	INFLUENCE_RATIO_CAPITAL = 0.05,            -- 基于首都距离的影响力权重
	INFLUENCE_RATIO_CORE = 0.45,               -- 基于最近核心领土距离的影响力权重
	INFLUENCE_RATIO_CONTROLLED = 0.5,          -- 基于最近已控制领土距离的影响力权重
	INFLUENCE_DISTANCE_DIVISOR = 22.0,         -- 像素距离除以该值以缩放距离数值

	INFLUENCE_PER_ADJACENCY = 0.05,  -- 每块无争议的相邻地区为和谈增添的影响力

	INFLUENCE_MAJOR_FACTOR = 1.0,  -- AI 大国的折扣倍率（取倒数）
	INFLUENCE_MINOR_FACTOR = 1.0,  -- AI 小国的折扣倍率（取倒数）

	PEACE_TRIGGER_AI_MAX_INFLUENCE_VALUE = 0.99,  -- AI 触发“州在影响范围外”条件的最大影响力值

	BASE_IMPROVE_RELATION_COST = 10,  -- 发起改善关系所需的基础 PP
	BASE_IMPROVE_RELATION_SAME_IDEOLOGY_GROUP_MAINTAIN_COST = 0.2,  -- 与相同意识形态国家持续改善关系的每日 PP 成本
	BASE_IMPROVE_RELATION_DIFFERENT_IDEOLOGY_GROUP_MAINTAIN_COST = 0.4,  -- 与不同意识形态国家持续改善关系的每日 PP 成本
	BASE_SEND_ATTACHE_COST = 100,  -- 派遣武官的 PP 成本
	BASE_SEND_ATTACHE_CP_COST = 50.0,  -- 派遣武官消耗的指挥点数
	BASE_GENERATE_WARGOAL_DAILY_PP = 0.2,  -- 每日制造战争借口的 PP 成本
	WARGOAL_VERSUS_MAJOR_AT_WAR_REDUCTION = -0.75,  -- 对正在交战的大国制造战争借口的 PP 成本减免
	WARGOAL_WORLD_TENSION_REDUCTION = -0.5,  -- 世界紧张度 100% 时的战争借口成本减免（线性缩放）
	WARGOAL_JUSTIFY_TENSION_FROM_PRODUCTION = 30.0,  -- 基于与最大国工业比值生成的初始紧张度
	MIN_WARGOAL_JUSTIFY_COST = 2.0,  -- 制造战争借口最少需要 10 天
	WARGOAL_PER_JUSTIFY_AND_WAR_COST_FACTOR = 1.5,  -- 每多一个与目标交战或正在制造借口的国家的成本倍率
	WARGOAL_THREAT_MAX_TIME_RATIO = 1.0,  -- 战争借口紧张度随进度线性累积，到达此比例时达到 100%
	BASE_BOOST_PARTY_POPULARITY_DAILY_PP = 0.25,  -- 每日提升政党人气的 PP 成本
	BASE_BOOST_PARTY_POPULARITY_DAILY_DRIFT = 0.1,  -- 每日活动增加的人气值
	BASE_STAGE_COUP_DAILY_PP = 0.5,  -- 每日策划政变 PP 成本
	BASE_STAGE_COUP_TOTAL_COST = 200,  -- 策划政变所需装备倍率
	NAP_EXPIRY_MONTHS = 48,  -- 互不侵犯条约到期时间（月）
	NAP_UNBREAKABLE_MONTHS = 12,  -- 互不侵犯条约签订后多少个月内不可单方面撕毁
	NAP_FORCE_BALANCE_RULE_MONTHS = 6,  -- 边界兵力平衡规则检查间隔（月）
	NAP_BREAK_FORCE_BALANCE_1 = 2.0,  -- 撕毁 NAP 所需边界兵力比 2:1
	NAP_BREAK_FORCE_BALANCE_2 = 1.0,  -- 撕毁 NAP 所需边界兵力比 1:1
	NAP_BREAK_FORCE_BALANCE_3 = 0.5,  -- 撕毁 NAP 所需边界兵力比 1:2
	VERY_GOOD_OPINION = 50,  -- 对方对你“非常好感”的关系阈值
	VERY_BAD_OPINION = -50,  -- 对方对你“非常恶感”的关系阈值
	DIPLOMACY_HOURS_BETWEEN_REQUESTS = 24,  -- 两次外交请求的最短间隔（小时）
	TROOP_FEAR = 1,  -- 边界驻军对贸易意愿的影响（陆军）
	FLEET_FEAR = 1,  -- 边界驻军对贸易意愿的影响（海军）
	IC_TO_EQUIPMENT_COUP_RATIO = 0.1,  -- 策划政变所需装备换算比例
	VOLUNTEERS_PER_TARGET_PROVINCE = 0.05,  -- 目标国每块省份增加的志愿军上限
	VOLUNTEERS_PER_COUNTRY_ARMY = 0.05,  -- 派遣国每支陆军单位增加的志愿军上限
	VOLUNTEERS_RETURN_EQUIPMENT = 0.95,  -- 志愿军归国时保留的装备比例
	VOLUNTEERS_TRANSFER_SPEED = 14,  -- 志愿军转移所需天数
	VOLUNTEERS_DIVISIONS_REQUIRED = 30,  -- 派遣志愿军所需的最低陆军师数
	TENSION_STATE_VALUE = 2,  -- 每吞并一块地区增加的世界紧张度
	TENSION_CIVIL_WAR_IMPACT = 0.2,  -- 内战对世界紧张度的倍率
	TENSION_NO_CB_WAR = 10,  -- 无正当理由战争产生的紧张度
	TENSION_CB_WAR = 7,  -- 有正当理由战争产生的紧张度
	TENSION_ANNEX_NO_CLAIM = 2,  -- 吞并无宣称地区产生的紧张度
	TENSION_ANNEX_CLAIM = 0.5,  -- 吞并有宣称地区产生的紧张度
	TENSION_ANNEX_CORE = 0,  -- 吞并核心地区不产生紧张度
	TENSION_PUPPET = 1.25,  -- 每傀儡一块地区产生的紧张度
	TENSION_FORCE_GOVERNMENT = 0.75,  -- 每强制改变一个地区政体产生的紧张度
	TENSION_VOLUNTEER_FORCE_DIVISION = 0.2,  -- 每派遣一个志愿师产生的紧张度
	TENSION_DECAY_DAILY = 0.005,  -- 每日过时的威胁源紧张度自然衰减
	TENSION_SIZE_FACTOR = 1.0,  -- 所有紧张度数值的全局倍率
	TENSION_TIME_SCALE_START_DATE = "1936.1.1.12",  -- 从此日期开始，紧张度数值随时间递减
	TENSION_TIME_SCALE_MONTHLY_FACTOR = -0.005,  -- 每月递减倍率
	TENSION_TIME_SCALE_MIN = 0.25,  -- 紧张度倍率不会低于此值
	TENSION_GUARANTEE = -5,  -- 保障独立减少的紧张度
	TENSION_FACTION_JOIN = 4,  -- 加入阵营增加的紧张度
	TENSION_JOIN_ATTACKER = 2,  -- 加入进攻方增加的紧张度
	TENSION_PEACE_FACTOR = 0.25,  -- 和平完成后，战争带来的紧张度减少比例
	TENSION_LIBERATE = -1,  -- 解放国家减少的紧张度
	TENSION_TAKE_ONE_CAPITAL_SHIP = 0.25,  -- 夺取一艘主力舰产生的紧张度
	TENSION_DEMILITARIZE_ZONE = 0.25,  -- 对一州叠加非军事区产生的紧张度
	TENSION_WAR_REPARATION = 0.25,  -- 对一州叠加战争赔款产生的紧张度
	TENSION_RESOURCE_RIGHTS = 0.25,  -- 对一州叠加资源权利产生的紧张度
	TENSION_DISMANTLE_INDUSTRY = 0.25,  -- 对一州叠加拆除军事工业产生的紧张度
	TENSION_CAPITULATE = 0.40,  -- 国家投降时产生的紧张度倍率
	GUARANTEE_COST = 25,  -- 保障独立的政治点数成本（随已保障国家数递增）
	REVOKE_GUARANTEE_COST = 25,  -- 撤销保障的政治点数成本
	BASE_CONDITIONAL_PEACE_WARESCORE_RATIO = 0.5,  -- 战败方需达到的战争分数比例才能主动投降
	BASE_CONDITIONAL_PEACE_MONTHS = 3,  -- 战争必须持续的最少月份数，方可投降
	JOINING_NAP_WAR_PENALTY = 0.2,  -- 撕毁不可破坏的互不侵犯条约的战争支持度惩罚
	BREAKING_GUARANTEE_PENALTY = 0.2,  -- 撕毁保障独立带来的战争支持度惩罚

	-- 警告！如修改以下数值，请同步更新 games_rules_l_english.yml 中的对应本地化键
	PEACE_SCORE_TRANSFERRED_TO_FACTION_LEADER = 0.1,  -- 若游戏规则启用，成员向阵营领袖转移的和平分数比例
	PEACE_SCORE_RESET_LOW_SCORE_THRESHOLD = 0.05,  -- 战争贡献低于此比例的胜者将把所有分数让给其他玩家
	PEACE_SCORE_RESET_LOW_SCORE_MINIMUM_FOR_RECEIVER = 0.1,  -- 若没有任何胜者达到此比例，则禁用上述让渡机制

	PEACE_SCORE_SCALE_FACTOR = 1.35,  -- 战败国总价值 × 此系数 = 分配给战胜国的默认总和平分数
	PEACE_SCORE_MINOR_BOOST_FRACTION = 0.05,  -- 低分胜者提前获得更多分数的最小比例
	-- 示例：本轮共分配 2000 分且此值=0.05，则每位胜者至少额外获得 100 分（受个人上限限制）

	PEACE_SCORE_DISTRIBUTION = { 0.2, 0.2, 0.2, 0.2, 0.2 },  -- 前几轮可获得的和平分数占比
	-- {1.0} 代表首轮直接拿满
	-- {0.5,0.5,0.5} 代表三轮各拿 50%，共拿 150%

	PEACE_CONTEST_REFUND_FACTOR = { 1.0, 0.92, 0.84, 0.76 },  -- 在和谈争夺中返还已花费分数的比例
	-- 第 1 轮冲突返还 100%，第 2 轮 92%，第 3 轮 84%，之后每轮 76%

	PEACE_PLAY_SOUND_ON_NEW_TURN = true,  -- 是否播放“peace_conference_new_turn”音效
	PEACE_PLAY_NEW_TURN_SOUND_ONLY_IF_NOT_ALREADY_PLAYING = true,  -- 若已在播放则不再重复播放

	MAX_REMEMBERED_LEASED_IC = 1000,  -- 因租借装备而获得好感上限的 IC 值
	MAX_OPINION_FOR_LEASED_IC = 30,   -- 达到上限时获得的最大好感
	MONTHLY_LEASED_IC_DECAY = 35,     -- 每月遗忘的租借 IC 值
	OPINION_PER_VOLUNTEER = 3,        -- 每派遣一个志愿师获得的好感
	MAX_OPINION_FROM_VOLUNTEERS = 30, -- 派遣志愿师可获好感上限
	OPINION_FOR_DEMO_FROM_WT_GENERATION = -2.0,  -- 民主国家因我们制造紧张度而减少的好感
	NOT_READY_FOR_WAR_BASE = -50,  -- AI 若未做好战争准备，则不愿接受参战请求
	FRONT_IS_DANGEROUS = -100,     -- AI 若认为前线过于危险，则不愿接受参战请求
	NOT_READY_FOR_WAR_VAL_PER_DAY_SINCE_CALL = 1,  -- 每过一天，上述“未准备好”惩罚减少 1 点

	PEACE_ACTION_MAX_COST = 9999,  -- 和平行动的最大成本上限（所有修正后）

	RESOURCE_SENT_AUTONOMY_DAILY_BASE = 0.0,  -- 傀儡每日向宗主提供资源时至少增加的自治度
	RESOURCE_SENT_AUTONOMY_DAILY_FACTOR = 0.005,  -- 傀儡每日向宗主提供资源时按此系数换算自治度
	WAR_SCORE_AUTONOMY_BASE = 0.0,  -- 傀儡贡献战争分数时的基础自治度增量
	WAR_SCORE_AUTONOMY_FACTOR = 0.6,  -- 傀儡贡献战争分数时的自治度倍率
	LL_TO_OVERLORD_AUTONOMY_DAILY_BASE = 0.0,  -- 傀儡向宗主租借同科技或更高科技装备时的基础自治度增量
	LL_TO_OVERLORD_AUTONOMY_DAILY_FACTOR = 0.05,  -- 傀儡向宗主租借装备时的自治度换算系数
	LL_TO_PUPPET_AUTONOMY_DAILY_BASE = 0.0,  -- 宗主向傀儡租借更高科技装备时的基础自治度减少
	LL_TO_PUPPET_AUTONOMY_DAILY_FACTOR = -0.01,  -- 宗主租借装备给傀儡的自治度换算系数（负值）
	AUTONOMY_FREEDOM_FROM_CAPITULATE = 0.5,  -- 宗主投降后傀儡立即获得的自治度
	ATTACHE_TO_SUBJECT_EFFECT = -0.05,  -- 宗主向傀儡派遣武官使傀儡每日减少的自治度
	ATTACHE_TO_OVERLORD_EFFECT = 0.05,  -- 傀儡向宗主派遣武官使傀儡每日增加的自治度

	AUTONOMY_LEVEL_CHANGE_SANCTUARY = 30,  -- 自治等级改变后 30 天内双方均无法再次调整
	AUTONOMY_LEVEL_CHANGE_PP_COST_BASE = 50.0,  -- 改变自治等级的基础 PP 花费
	AUTONOMY_LEVEL_CHANGE_PP_ANNEX = 300,  -- 直接吞并傀儡所需的 PP
	AUTONOMY_LEVEL_CHANGE_PP_FREE = 300,  -- 傀儡独立所需的 PP
	MAX_SCORE_DIFF_TO_CHANGE_AUTONOMY = 10,  -- 当前自由分与上下级门槛差值的最大允许范围
	MASTER_BUILD_AUTONOMY_FACTOR = -0.7,  -- 宗主建造增加傀儡自治度时的倍率（负值）
	VICTORY_POINT_WORTH_FACTOR = 10,  -- 胜利点计算省份价值时的倍率（投降）
	VICTORY_POINT_WORTH_FACTOR_WARSCORE = 0.2,  -- 胜利点在战争分数计算中的倍率
	PROVINCE_WORTH_FROM_STATE_VALUE_FACTOR_WARSCORE = 0.2,  -- 省份从州价值中获得战争分数的倍率
	CAPITAL_CAPITULATE_BONUS_SCORE = 150,  -- 首都持有者投降时的额外投降分数
	CAPITAL_CAPITULATE_BONUS_SCORE_MUL = 1.5,  -- 首都持有者投降时的额外倍率
	IDEOLOGY_JOIN_FACTION_MIN_LEVEL = 0.3,  -- 加入阵营所需的意识形态阈值
	JOIN_FACTION_LIMIT_CHANGE_AT_WAR = 0.5,  -- 防御战争中，此值或现有修正取较高者作为加入阵营门槛
	LICENSE_ACCEPTANCE_OPINION_FACTOR = 0.4,  -- 许可生产请求中关系对接受度的倍率
	LICENSE_ACCEPTANCE_PUPPET_BASE = 15,  -- 傀儡请求许可生产的基础接受度加成
	LICENSE_ACCEPTANCE_TECH_DIFFERENCE = 2,  -- 每差一年科技，接受度修正值
	LICENSE_ACCEPTANCE_TECH_DIFFERENCE_BASE = 10,  -- 许可生产科技差的基础接受度
	LICENSE_ACCEPTANCE_SAME_FACTION = 20,  -- 同阵营请求许可生产的接受度加成

	WARGOAL_COST_LEND_LEASE = -0.25,  -- 租借装备对战争借口成本的修正（负值）
	WARGOAL_COST_DOCKING_RIGHTS = -0.2,  -- 港口停靠权对战争借口成本的修正
	WARGOAL_COST_VOLUNTEERS = -0.5,  -- 派遣志愿师对战争借口成本的修正

	ASSUME_FACTION_LEADERSHIP_PP_COST = 200,  -- 夺取阵营领袖所需的 PP
	ASSUME_FACTION_LEADERSHIP_MIN_MANPOWER_RATIO = 2,  -- 需拥有当前领袖 2 倍人力方可夺取
	ASSUME_FACTION_LEADERSHIP_MIN_FACTORY_RATIO = 1.5,  -- 需拥有当前领袖 1.5 倍工厂方可夺取
	ASSUME_FACTION_LEADERSHIP_COOLDOWN_DAYS = 180,  -- 阵营建立或领袖变更后 180 天内不可再次夺取
	ASSUME_FACTION_SPYMASTER_COOLDOWN_DAYS = 180,  -- 间谍主管变更后 180 天内不可再次变更
	FACTION_LEADERSHIP_CHANGE_ALERT_THRESHOLD = 0.8,  -- 当成员接近可夺取领袖时的警报阈值
	FACTION_LEADERSHIP_CHANGE_NOT_SUBJECT_WEIGHT = 2,  -- 非傀儡身份在夺取领袖计算中的权重
	FACTION_LEADERSHIP_CHANGE_NOT_CAPITULATED_WEIGHT = 2,  -- 未投降在夺取领袖计算中的权重
	FACTION_LEADERSHIP_CHANGE_IN_ALL_WARS_WEIGHT = 1,  -- 参加所有领袖战争在计算中的权重
	FACTION_LEADERSHIP_CHANGE_COOLDOWN_WEIGHT = 1,  -- 领袖变更冷却在计算中的权重
	FACTION_LEADERSHIP_CHANGE_MANPOWER_WEIGHT = 2,  -- 现役人力在夺取领袖计算中的权重
	FACTION_LEADERSHIP_CHANGE_FACTORY_WEIGHT = 2,  -- 工厂数量在夺取领袖计算中的权重

	EMBARGO_COST = 100,  -- 实施禁运的一次性成本
	REVOKE_EMBARGO_COST = 0,  -- 撤销禁运的成本
	EMBARGO_THREAT_THRESHOLD = 30,  -- 目标产生威胁值达到此阈值方可对其禁运（受修正影响）

	EMBARGO_SAME_IDEOLOGY_AI_WEIGHT = -20,  -- AI 对相同意识形态实施禁运的权重修正
	EMBARGO_DIFFERENT_IDEOLOGY_AI_WEIGHT = 15,  -- AI 对不同意识形态实施禁运的权重修正
	EMBARGO_DIFFERENT_IDEOLOGY_AT_OFFENSIVE_WAR_AI_WEIGHT = 10,  -- AI 对不同意识形态且处于进攻战时的额外权重
	EMBARGO_RECIPIENT_IS_MAJOR_AI_WEIGHT = 10,  -- AI 对大国实施禁运的权重修正
	EMBARGO_NEIGHBOUR_AI_WEIGHT = -10,  -- AI 对邻国实施禁运的权重修正（邻国强大，需谨慎）

	EQUIPMENT_PURCHASE_ACCEPTANCE_OPINION = 1.1,  -- 关系对装备采购接受度的倍率
	EQUIPMENT_PURCHASE_ACCEPTANCE_SAME_IDEOLOGY = 15,  -- 相同意识形态增加的接受度
	EQUIPMENT_PURCHASE_ACCEPTANCE_SCRIPTED_IDEOLOGY_ACCEPTANCE = 1.0,  -- 脚本意识形态修正的倍率
	EQUIPMENT_PURCHASE_ACCEPTANCE_TRADE_INFLUENCE = 0.70,  -- 贸易影响力倍率（已调整）
	EQUIPMENT_PURCHASE_ACCEPTANCE_COMPETING_FACTIONS = -30,  -- 双方属于不同阵营的接受度惩罚
	EQUIPMENT_PURCHASE_ACCEPTANCE_EMBARGO = -200,  -- 任一方已禁运的接受度惩罚
	EQUIPMENT_PURCHASE_ACCEPTANCE_NON_AGGRESSION_PACT = 25,  -- 存在互不侵犯条约的接受度加成

	MARKET_ACCESS_ACCEPTANCE_OPINION = 1.1,  -- 关系对市场准入接受度的倍率
	MARKET_ACCESS_ACCEPTANCE_SAME_IDEOLOGY = 15,  -- 相同意识形态增加的接受度
	MARKET_ACCESS_ACCEPTANCE_SCRIPTED_IDEOLOGY_ACCEPTANCE = 1.0,  -- 脚本意识形态修正的倍率
	MARKET_ACCESS_ACCEPTANCE_TRADE_INFLUENCE = 0.70,  -- 贸易影响力倍率（已调整）
	MARKET_ACCESS_ACCEPTANCE_COMPETING_FACTIONS = -30,  -- 双方属于不同阵营的接受度惩罚
	MARKET_ACCESS_ACCEPTANCE_EMBARGO = -200,  -- 任一方已禁运的接受度惩罚
	MARKET_ACCESS_ACCEPTANCE_NO_TRADE_ROUTE = -100,  -- 无有效贸易路线的接受度惩罚
	MARKET_ACCESS_ACCEPTANCE_NON_AGGRESSION_PACT = 25,  -- 存在互不侵犯条约的接受度加成
}