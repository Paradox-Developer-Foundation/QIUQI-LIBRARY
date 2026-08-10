

Code
[[

// --------------------------------------------------------------
// A collection of constants that can be used to tweak the shaders
// To update: run "reloadfx all"
// --------------------------------------------------------------

// --------------------------------------------------------------
// ------------------    Light          -------------------------
// --------------------------------------------------------------
static const float NIGHT_AMBIENT_BOOST = 3.0f; // can just be baked into the below later ye?


static const float3 DayAmbientMapPosX = float3(0.1, 0.1, 0.05);  // right
static const float3 DayAmbientMapNegX = float3(0.15, 0.15, 0.15);  // left
static const float3 DayAmbientMapPosY = float3(0.03, 0.03, 0.06);  // kills everything
static const float3 DayAmbientMapNegY = float3(0.0, 0.0, 0.0);  // from under
static const float3 DayAmbientMapPosZ = float3(0.0502, 0.05023, 0.1023);  // top
static const float3 DayAmbientMapNegZ = float3(0.03, 0.033, 0.033);  // bottom

static const float3 NightAmbientMapPosX = float3(0.2, 0.2, 0.2);  // right
static const float3 NightAmbientMapNegX = float3(0.0, 0.0, 0.0);  // left
static const float3 NightAmbientMapPosY = float3(0.01, 0.01, 0.01);  // kills everything
static const float3 NightAmbientMapNegY = float3(0.0, 0.0, 0.1);  // from under
static const float3 NightAmbientMapPosZ = float3(0.06, 0.1, 0.15);  // top
static const float3 NightAmbientMapNegZ = float3(0.14, 0.14, 0.2);  // bottom

// NOTE: regular unit ambient colors set from defines. this is night
static const float3 NightAmbientPosX = float3(2.0, 2.0, 2.0);  // right
static const float3 NightAmbientNegX = float3(0.2, 0.2, 0.2);  // left
static const float3 NightAmbientPosY = float3(0.1, 0.1, 0.1);  // kills everything
static const float3 NightAmbientNegY = float3(0.0, 0.0, 0.0);  // from under
static const float3 NightAmbientPosZ = float3(3.0, 3.0, 3.0);  // top
static const float3 NightAmbientNegZ = float3(0.8, 0.8, 0.8);  // bottom

// --------------------------------------------------------------
// ------------------    Specular       -------------------------
// --------------------------------------------------------------
static const float SPECULAR_WIDTH 				= 15.0;
static const float SPECULAR_MULTIPLIER			= 1.0;
static const float MAP_SPECULAR_WIDTH			= 15.0;

// --------------------------------------------------------------
// ------------------    TERRAIN        -------------------------
// --------------------------------------------------------------
static const float CITY_LIGHTS_TILING 			= 0.09103;
static const float CITY_LIGHTS_INTENSITY 		= 5.5;
static const float CITY_LIGHTS_BLOOM_FACTOR 	= 0.3;

static const float TERRAIN_TILE_FREQ 			= 128.0f;
static const float MAP_NUM_TILES 				= 4.0f;
static const float TEXELS_PER_TILE 				= 512.0f;
static const float ATLAS_TEXEL_POW2_EXPONENT	= 11.0f;
static const float TERRAIN_WATER_CLIP_HEIGHT    = 3.0f;
static const float TERRAIN_WATER_CLIP_CAM_HI	= 700.0f;
static const float TERRAIN_WATER_CLIP_CAM_LO	= 50.0f;

static const float MUD_TILING 					= 0.07;
static const float MUD_NORMAL_CUTOFF 			= 10.982;
static const float MUD_STRENGHTEN 				= 1.0;

static const float 	SNOW_OPACITY_MIN			= 0.95f;
static const float 	SNOW_OPACITY_MAX			= 0.2f;
static const float 	SNOW_CAM_MIN 				= 50.0f;
static const float 	SNOW_CAM_MAX 				= 300.0f;
static const float 	ICE_CAM_MIN 				= 100.0f;
static const float 	ICE_CAM_MAX 				= 350.0f;


static const float 	SNOW_START_HEIGHT 			= 3.0f;
static const float 	SNOW_RIDGE_START_HEIGHT 	= 11.0f;
static const float 	SNOW_NORMAL_START 			= 0.7f;
static const float3 SNOW_COLOR 					= float3( 0.46, 0.48, 0.69 );
static const float3 SNOW_WATER_COLOR 			= float3( 0.3, 0.6, 1.0 );
static const float 	SNOW_CLIFFS 				= 5.0f;
static const float 	SNOW_SPEC_GLOSS_MULT 		= 0.2f;
static const float 	SNOW_TILING  				= 0.05f;
static const float 	SNOW_NOISE_TILING  			= 0.06f;
static const float 	SNOW_ICE_NOISE_TILING  		= 0.0625f;
static const float 	SNOW_FROST_MIN_EFFECT  		= 0.4f;

static const float3 ICE_COLOR 					= float3( 0.5f, 0.6f, 0.9f );
static const float 	ICE_NOISE_TILING  			= 0.1f; //0.068f;

static const float WATER_COLOR_LIGHTNESS = 0.5;
static const float WATER_RIPPLE_EFFECT = 0.0025;

static const float COLORMAP_OVERLAY_STRENGTH 	= 0.75f; //0.7f;
static const float3 FAKE_CUBEMAP_COLOR 			= float3(0.0f, 0.0f, 0.0f);

// MILD_WINTER_VALUE = ###,						defines.lua   (reload defines)
// NORMAL_WINTER_VALUE = ##,					defines.lua   (reload defines)
// SEVERE_WINTER_VALUE = ###,					defines.lua   (reload defines)


static const float 	BORDER_TILE					= 0.4f;
// BORDER_WIDTH		= ###						defines.lua   (reload defines)



// Snow color									standardfuncsgfx.fxh   
// static const float3 SNOW_COLOR = float3( 0.8f, 0.8f, 0.8f );
// Snow fade									standardfuncsgfx.fxh   
// 	float vSnow = saturate( saturate( vNoise - ( 1.0f - vIsSnow ) ) * 5.0f );

static const float 	TREE_SEASON_MIN 			= 0.5f;
static const float 	TREE_SEASON_FADE_TWEAK 		= 2.5f;

// --------------------------------------------------------------
// ------------------    HDR          	-------------------------
// --------------------------------------------------------------
static const float3 LUMINANCE_VECTOR  			= float3(0.2125f, 0.7154f, 0.0721f);

// --------------------------------------------------------------
// ------------------    TREES          -------------------------
// --------------------------------------------------------------
static const float 	TREE_SPECULAR = 0.1f;
static const float 	TREE_ROUGHNESS = 0.6f;

// --------------------------------------------------------------
// ------------------    WATER          -------------------------
// --------------------------------------------------------------

//static const float  WATER_TILE					= 4.0f;
static const float  WATER_TIME_SCALE			= 1.0f / 50.0f;
static const float  WATER_HEIGHT = 9.5f;
static const float  WATER_HEIGHT_RECP = 1.0f / WATER_HEIGHT;
static const float  WATER_HEIGHT_RECP_SQUARED = WATER_HEIGHT_RECP * WATER_HEIGHT_RECP;


// --------------------------------------------------------------
// ------------------    BUILDINGS      -------------------------
// --------------------------------------------------------------

//	PORT_SHIP_OFFSET = 2.0,					defines.lua   (reload defines)
//	SHIP_IN_PORT_SCALE = 0.25,				
//  BUILDING SIZE?



// --------------------------------------------------------------
// ------------------    FOG            -------------------------
// --------------------------------------------------------------

static const float3 FOG_COLOR 					= float3( 0.12, 0.28, 0.6 );
static const float 	FOG_BEGIN					= 1.0f;
static const float 	FOG_END 					= 150.0f;
static const float 	FOG_MAX 					= 0.35f; 

//static const float 	FOG_MAX 					= 1000.7f;

// Fog of war
static const float 	FOW_MAX 					= 0.5f;
static const float  FOW_CAMERA_MIN				= 200;
static const float  FOW_CAMERA_MAX				= 500;


// --------------------------------------------------------------
// ------------------    BUILDINGS      -------------------------
// --------------------------------------------------------------


static const float  SHADOW_WEIGHT_TERRAIN    	= 0.7f;
static const float  SHADOW_WEIGHT_MAP    		= 0.7f;
static const float  SHADOW_WEIGHT_BORDER   		= 0.7f;
static const float  SHADOW_WEIGHT_WATER   		= 0.5f;
static const float  SHADOW_WEIGHT_RIVER   		= 0.4f;
static const float  SHADOW_WEIGHT_TREE   		= 0.7f;

// LIGHT_SHADOW_DIRECTION_X = -8.0				defines.lua   (reload defines)
// LIGHT_SHADOW_DIRECTION_Y = -8.0				defines.lua   (reload defines)
// LIGHT_SHADOW_DIRECTION_Z = 5.0				defines.lua   (reload defines)


// --------------------------------------------------------------
// ------------------    CAMERA         -------------------------
// --------------------------------------------------------------



// CAMERA_MIN_HEIGHT = 50.0,					defines.lua   (reload defines)
// CAMERA_MAX_HEIGHT = 3000.0,					defines.lua   (reload defines)

// --------------------------------------------------------------
// ------------------    GRADIENT BORDERS   ---------------------
// --------------------------------------------------------------

static const float GB_CAM_MIN = 5.0f;//默认100f
static const float GB_CAM_MAX = 100.0f;//默认350f，与上一条共同划定了镜头采用远镜头样式（或者说远景边框）的区间，只要min和max都调的够低，那么镜头就要拉的非常非常近才会切换为近景镜头
static const float GB_CAM_MAX_FILLING_CLAMP = 1.0f; // 在0-1之间取，决定了近距离镜头和远距离镜头的分界，也就是下面的GB_OPACITY_NEAR和GB_OPACITY_FAR的分界，0的时候全是近距离镜头的样式，越大则需要放大地图越多才会变成近距离镜头。
static const float GB_THRESHOLD = 0.05f; // 插值时间
static const float GB_THRESHOLD2 = 0.25f; // interpolation time
//static const float3 GB_OUTLINE_COLOR = float3( 0.0f, 0.0f, 0.0f );
static const float GB_OUTLINE_CUTOFF_SEA = 0.990f; // Magic number to balance cutoff on edges without neighbor (over Sea)
static const float GB_OPACITY_NEAR = 1.0f; // ##镜头在近处的时候国家颜色的不透明度，越低越透明，越高越深色甚至会过曝
static const float GB_OPACITY_FAR = 1.0f;  // ##镜头在远处的时候国家颜色的不透明度，越低越透明，越高越深色甚至会过曝。例子：FPS MAP里面该项是1.0f,原版是0.85f，这也是为什么fps map在远距离的时候国家颜色会更深
static const float BORDER_NIGHT_DESATURATION_MAX = 0.2f; // how much border colors can get desaturated at night. 1.0f is full grey
static const float BORDER_FOW_REMOVAL_FACTOR = 0.8f; // 国家边界上移除的战场雾气，1.0f就是没有雾气（低于-0.8会崩溃）（测试了一下没太看出来有啥区别，估计可以不管）
static const float BORDER_LIGHT_REMOVAL_FACTOR = 0.3f; // 国家边界上移除的光亮，1.0f就是没有光。也就是说越大，边界的光越多（实测后发现还和全局光相关，如果调高的话低地（比如峡谷和海岸）的亮度就会上升，如果调低了话高低（比如山脉）的亮度就会上升）（调成0.1就会有类似冷战地图的效果）。！！！绝对不能调1.5以上！！！电脑会崩溃！！！
static const float GB_STRENGTH_CH1 = 1.0; //底层颜色的不透明度（和BORDER_LIGHT_REMOVAL_FACTOR类似，基础是1）
static const float GB_STRENGTH_CH2 = 0.9; // 顶层颜色的不透明度（有点像是全局光的感觉，越高光线越暗）（该选项还会和GB_OPACITY_FAR相关联。在GB_OPACITY_FAR高数值的情况下同等数值的GB_STRENGTH_CH2会更深）
static const float GB_FIRST_LAYER_PRIORITY = 0.4; // 当第一层/第二层（上述的两个GB_STRENGTH）在同一像素上处于活动状态时，第一层/第二层的优先级（没调明白，看上去没大效果）
static const float BORDER_MAP_TILE = 18000.0f;//没测试出来有啥用

// --------------------------------------------------------------
// ------------------    SECONDARY COLOR MAP   ------------------
// --------------------------------------------------------------

static const float SEC_MAP_TILE = 6000.0f;


// --------------------------------------------------------------
// ------------------    MAP ARROWS   ---------------------------
// --------------------------------------------------------------

static const float MAP_ARROW_SEL_BLINK_SPEED = 5.5f;
static const float MAP_ARROW_SEL_BLINK_RANGE = 0.7f;
static const float MAP_ARROW_NORMALS_STR_TERR = 0.0125f;
static const float MAP_ARROW_NORMALS_STR_WATER = 0.08f;

// --------------------------------------------------------------
// ------------------    PARTICLES   ----------------------------
// --------------------------------------------------------------
static const float PARTICLE_FADE_START_DISTANCE = 100;
static const float PARTICLE_FADE_STOP_DISTANCE = 350;

// --------------------------------------------------------------
// -------------    RIM LIGHT (PDXMESH)   -----------------------
// --------------------------------------------------------------
static const float 	RIM_START 		= 0.55f;
static const float 	RIM_END 		= 0.6f;
static const float4 RIM_COLOR 		= float4( 0.3f, 0.3f, 0.3f, 0.0f );


// --------------------------------------------------------------
// -------------    MAP BORDER (PDXMESH)   ----------------------
// --------------------------------------------------------------
static const float3 BORDER_SUN_INTENSITY = float3(1.5, 1.5, 1.6);
static const float3 BORDER_SUN_DIRECTION = float3(-0.2, 0.9, 0.1);
//static const float3 BORDER_SUN_DIRECTION = float3(-0.1, 0.5, 0.0);
//static const float3 BORDER_SUN_DIRECTION = float3(0.2, 0.5, 0.0);
]]