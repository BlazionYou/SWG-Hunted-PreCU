TatooineMosEspaScreenPlay = CityScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "TatooineMosEspaScreenPlay",

	planet = "tatooine",

	gcwMobs = {
		{"comm_operator", "rebel_resistance_dissident", -2960.4,5,1973.9,74,0, "npc_imperial", "angry", true},
		{"dark_trooper", "rebel_commando", -3028.58,5.11515,2618.21,39.6237,0, "", "", true},
		{"dark_trooper", "rebel_commando", -2636.4,5,2254.3,81,0, "", "", true},
		{"dark_trooper", "rebel_commando", -2953.88,5,1933.16,344.533,0, "npc_imperial", "neutral"},
		{"imperial_master_sergeant", "rebel_master_sergeant", -2954.65,5,1935.93,344.531,0, "npc_imperial", "neutral", true},
		{"imperial_master_sergeant", "rebel_master_sergeant", -3115,5,2199.8,-75,0, "npc_imperial", "neutral", true},
		{"imperial_master_sergeant", "rebel_master_sergeant", -3204.52,5,2091.93,204.135,0, "", "", true},
		{"imperial_master_sergeant", "rebel_master_sergeant", -3029.53,5.07697,2617.06,39.7527,0, "", ""},
		{"imperial_noncom", "rebel_corporal", -2648.9,5,2290.2,67,0, "npc_imperial", "neutral", true},
		{"imperial_noncom", "rebel_corporal", -3027.01,5.06395,2617.66,289.047,0, "npc_imperial", "neutral"},
		{"imperial_warrant_officer_ii", "rebel_warrant_officer_ii", -3207,5,2097.52,347.895,0, "", ""},
		{"sand_trooper", "rebel_trooper", -2985.75,5,1978.7,74.49,0, "npc_imperial", "neutral", true},
		{"sand_trooper", "rebel_trooper", -2963.4,5,1978.6,75,0, "npc_imperial", "neutral"},
		{"sand_trooper", "rebel_trooper", -2988.1,5,1978.04,74.4903,0, "npc_imperial", "neutral"},
		{"sand_trooper", "rebel_trooper", -2960.1,5,1968.6,67,0, "npc_imperial", "neutral"},
		{"sand_trooper", "rebel_trooper", -2695.6,5,1982.9,122,0, "", "", true},
		{"sand_trooper", "rebel_trooper", -3170.7,5,2137.7,-30,0, "", "", true},
		{"sand_trooper", "rebel_trooper", -3028.33,5.01162,2616.08,294.927,0, "", ""},
		{"scout_trooper", "rebel_scout", -2982.5,5,1956.8,73,0, "", ""},
		{"scout_trooper", "rebel_scout", -3029.2,5,2614.8,-52,0, "", ""},
		{"stormtrooper", "rebel_crewman", -3207.39,5,2099.33,347.898,0, "", ""},
		{"stormtrooper", "rebel_crewman", -3203.5,5,2091.5,-159,0, "", ""},
		{"stormtrooper_captain", "rebel_army_captain", -3026.34,5.10198,2618.73,289.047,0, "npc_imperial", "conversation"},
		{"stormtrooper_squad_leader", "rebel_resistance_leader", -2979.8,5,1957.6,67,0, "npc_imperial", "npc_consoling", true},
		{"mos_espa_police_officer", "mos_espa_police_officer_rebel", -3022.29,5.02759,2618.41,268.2,0, "", "", true},
		{"mos_espa_police_officer", "mos_espa_police_officer_rebel", -2976.17,5,2009.31,171.013,0, "", "", true},
		{"mos_espa_police_officer", "mos_espa_police_officer_rebel", -3023.4,5,2618.4,86,0, "", ""},
		{"mos_espa_police_officer", "mos_espa_police_officer_rebel", -2977.32,5,2010.1,171.012,0, "", ""},
		{"mos_espa_police_officer", "mos_espa_police_officer_rebel", -3022.7,5.1,2619.6,-171,0, "", ""},
		{"mos_espa_police_officer", "mos_espa_police_officer_rebel", -2976.54,5,2011.63,171.014,0, "", ""},
	},

	patrolNpcs = {"commoner_fat_patrol", "commoner_old_patrol", "commoner_tatooine_patrol", "commoner_technician_patrol", "explorer_patrol", "gambler_patrol", "scientist_patrol"},

	patrolMobiles = {
		--{patrolPoints, template, x, z, y, direction, cell, mood, combatPatrol},

		--Droids
		{"cll8_1", "cll8_binary_load_lifter", -2922.62, 5, 2143.4, 19.5832, 0, "", false},
		{"eg6_1", "eg6_power_droid", -2833.22, 5, 1899.71, 245.01, 0, "", false},
		{"eg6_2", "eg6_power_droid", -2928.04, 5, 1977.68, 330.633, 0, "", false},
		{"eg6_3", "eg6_power_droid", -2945.98, 5, 2470.9, 186.376, 0, "", false},
		{"r2_1", "r2", -2928.79, 5, 2111.03, 245.497, 0, "", false},
		{"r2_2", "r2", -2946.8, 5, 2468.6, 350.917, 0, "", false},
		{"r4_1", "r4", -2959.44, 5, 2110.92, 112.101, 0, "", false},
		{"r4_2", "r4", -2873, 5, 1984, 252.493, 0, "", false},
		{"r5_1", "r5", -2935.94, 5, 2275.75, 205.483, 0, "", false},
		{"r5_2", "r5", -2915.25, 5, 2163.42, 154.028, 0, "", false},
		{"r5_3", "r5", -2919.36, 5, 2262.73, 15.6789, 0, "", false},

		--NPCs
		{"npc_1", "patrolNpc", -2905, 5, 2163, 180, 0, "", false},
		{"npc_2", "patrolNpc", -2952, 5, 2087, 46, 0, "", false},
		{"npc_3", "patrolNpc", -2914, 5, 1984, 26, 0, "", false},
		{"npc_4", "patrolNpc", -2754, 5, 1981, 94, 0, "", false},
		{"npc_5", "patrolNpc", -2715, 5, 2040, 144, 0, "", false},
		{"npc_6", "patrolNpc", -3046, 5, 2133, 249, 0, "", false},
		{"npc_7", "patrolNpc", -3100, 5, 2148, 158, 0, "", false},
		{"npc_8", "patrolNpc", -2954, 5, 2235, 232, 0, "", false},
		{"npc_9", "patrolNpc", -2914, 5, 2466, 163, 0, "", false},
		{"npc_10", "patrolNpc", -2770, 5, 2245, 214, 0, "", false},
		{"npc_11", "patrolNpc", -2731, 5, 2226, 196, 0, "", false},
	},

	patrolPoints = {
		--table_name = {{x, z, y, cell, delayAtNextPoint}}
		cll8_1 = {{-2922, 5, 2144, 0, false}, {-2912, 5, 2157, 0, false}, {-2856, 5, 2154, 0, false}, {-2902, 5, 2148, 0, false}, {-2922, 5, 2111, 0, false}},
		eg6_1 = {{-2833, 5, 1899, 0, false}, {-2788, 5, 1875, 0, false}, {-2823, 5, 1924, 0, false}, {-2834, 5, 1958, 0, false}, {-2878, 5, 1955, 0, false}, {-2831, 5, 1954, 0, false}, {-2821, 5, 1913, 0, false}},
		eg6_2 = {{-2928, 5, 1977, 0, false}, {-2955, 5, 1974, 0, false}, {-2918, 5, 2010, 0, false}, {-2898, 5, 1956, 0, false}},
		eg6_3 = {{-2945, 5, 2470, 0, false}, {-2924, 5, 2472, 0, false}, {-2919, 5, 2505, 0, false}, {-2898, 5, 2476, 0, false}, {-2912, 5, 2460, 0, false}},
		r2_1 = {{-2928, 5, 2111, 0, false}, {-2925, 5, 2090, 0, false}, {-2923, 5, 2052, 0, false}, {-2952, 5, 2042, 0, false}},
		r2_2 = {{-2946, 5, 2468, 0, true}, {-2906, 5, 2447, 0, false}, {-2920, 5, 2428, 0, false}, {-2921, 5, 2400, 0, false}, {-2922, 5, 2422, 0, falses}, {-2944, 5, 2438, 0, false}},
		r4_1 = {{-2959, 5, 2110, 0, false}, {-2994, 5, 2119, 0, true}, {-3048, 5, 2141, 0, false}, {-2994, 5, 2119, 0, false}},
		r4_2 = {{-2873, 5, 1984, 0, false}, {-2860, 5, 1987, 0, true}, {-2895, 5, 1981, 0, false}, {-2922, 5, 2044, 0, false}, {-2899, 5, 1983, 0, false}},
		r5_1 = {{-2935, 5, 2275, 0, false}, {-2910, 5, 2323, 0, false}, {-2923, 5, 2398, 0, false}, {-2910, 5, 2323, 0, false}},
		r5_2 = {{-2915, 5, 2163, 0, false}, {-2927, 5, 2164, 0, false}, {-2964, 5, 2218, 0, false}, {-2939, 5, 2226, 0, false}, {-2912, 5, 2175, 0, false}},
		r5_3 = {{-2919, 5, 2262, 0, false}, {-2957, 5, 2244, 0, false}, {-3040, 5, 2230, 0, false}, {-2972, 5, 2237, 0, false}},

		npc_1 = {{-2905, 5, 2163, 0, true}, {-2900, 5, 2136, 0, true}, {-2898, 5, 2125, 0, true}, {-2909, 5, 2123, 0, true}},
		npc_2 = {{-2952, 5, 2087, 0, true}, {-2930, 5, 2078, 0, true}, {-2953, 5, 2058, 0, true}, {-2966, 5, 2107, 0, true}, {-2947, 5, 2101, 0, true}},
		npc_3 = {{-2914, 5, 1984, 0, true}, {-2878, 5, 1957, 0, true}, {-2909, 5, 1945, 0, true}, {-2939, 5, 1999, 0, true}},
		npc_4 = {{-2754, 5, 1981, 0, true}, {-2785, 5, 1983, 0, true}, {-2763, 5, 2016, 0, true}, {-2744, 5, 1991, 0, true}, {-2746, 5, 2008, 0, true}},
		npc_5 = {{-2715, 5, 2040, 0, true}, {-2732, 5, 2084, 0, true}, {-2747, 5, 2039, 0, true}, {-2707, 5, 2057, 0, true}},
		npc_6 = {{-3046, 5, 2133, 0, true}, {-3082, 5, 2124, 0, true}, {-3064, 5, 2151, 0, true}, {-3036, 5, 2119, 0, true}},
		npc_7 = {{-3100, 5, 2148, 0, true}, {-3136, 5, 2136, 0, true}, {-3103, 5, 2155, 0, true}, {-3113, 5, 2181, 0, true}},
		npc_8 = {{-2954, 5, 2235, 0, true}, {-2967, 5, 2254, 0, true}, {-2945, 5, 2271, 0, true}, {-2941, 5, 2214, 0, true}, {-2953, 5, 2246, 0, true}},
		npc_9 = {{-2914, 5, 2466, 0, true}, {-2914, 5, 2489, 0, true}, {-2956, 5, 2536, 0, true}, {-2897, 5, 2476, 0, true}},
		npc_10 = {{-2770, 5, 2245, 0, true}, {-2732, 5, 2254, 0, true}, {-2754, 5, 2219, 0, true}, {-2766, 5, 2281, 0, true}},
		npc_11 = {{-2731, 5, 2226, 0, true}, {-2693, 5, 2264, 0, true}, {-2729, 5, 2263, 0, true}, {-2705, 5, 2240, 0, true}},
	},

	stationaryCommoners = {"commoner", "commoner_fat", "commoner_old", "commoner_tatooine"},
	stationaryNpcs = {"artisan", "brawler", "bodyguard", "bothan_diplomat", "bounty_hunter", "businessman", "commoner_technician", "contractor", "criminal", "entertainer", "explorer", "farmer", "farmer_rancher", "fringer",
			"gambler", "info_broker", "medic", "mercenary", "miner", "noble", "official", "pilot", "rancher", "scavenger", "scientist", "slicer"},

	--{respawn, x, z, y, direction, cell, mood}
	stationaryMobiles = {
		{1, -2918.94, 5, 2169.6, 0, 0, "conversation"}, {1, -2881.87, 5, 2142.69, 18.8035, 0, ""}, {1, -2787.25, 5, 1962.04, 14.8999, 0, ""}, {1, -2939.1, 5, 1962.9, 15.9578, 0, ""},
		{1, -2912.23, 5, 1928.7, 337.934, 0, ""}, {1, -2881.87, 5, 1974.41, 329.04, 0, ""}, {1, -3019.69, 5, 2114.97, 73.4692, 0, ""}, {1, -2881.8, 5, 2267.4, 180, 0, ""},
		{1, -2897.39, 5, 2323.06, 54.7434, 0, ""}, {1, -2976.72, 5.52789, 2333.09, 215.86, 0, ""},	{1, -2931.98, 5, 2495.44, 266.081, 0, ""}, {1, -2774.25, 5, 2018.1, 237.899, 0, ""},
		{1, -2739.74, 5, 2044.75, 99.9046, 0, ""}, {1, -2722.49, 5, 2007.18, 217.488, 0, ""}, {1, -2767.35, 5, 2232.76, 164.701, 0, ""}, {1, -2766.88, 5, 2314.77, 201.13, 0, ""},
		{1, -2901.2, 5, 2360.3, 241, 0, "npc_sitting_chair"}, {1, -2868.4, 5, 2493.9, 238, 0, "npc_sitting_chair"}, {1, -2877.18, 5, 2473.48, 293.853, 0, ""}, {1, -2886.35, 5, 2377.12, 323.001, 0, ""},
		{1, -2890.19, 5, 2251.37, 190.438, 0, ""}, {1, -2839.04, 5, 2492.89, 55.3765, 0, ""}, {1, -2874.25, 5, 2546.29, 122.899, 0, ""}, {1, -2881.23, 5, 2004.94, 233.054, 0, ""},
		{1, -2818.45, 5, 2407.94, 238.346, 0, ""}, {1, -2859.3, 5, 2288.53, 351.513, 0, ""}, {1, -3007.6, 5, 2372.2, -133, 0, ""}, {1, -2860.36, 5, 2212.37, 343.92, 0, ""},
		{1, -2831.34, 5, 1912.49, 217.51, 0, ""}, {1, -2807.11, 5, 1953.71, 320.134, 0, ""}, {1, -3115.34, 5, 2084.32, 284.484, 0, ""}, {1, -3000.81, 5, 2213.95, 148.773, 0, ""},
		{1, -2978.76, 5, 2473.24, 5.89742, 0, ""}, {1, -2884.43, 5, 2575.51, 325.132, 0, ""}, {1, -2894.24, 5, 2492.22, 84.423, 0, ""}, {1, -2810.06, 5, 2318.02, 268.996, 0, ""},
	},

	mobiles = {
		--Starport
		{"chassis_dealer",60,2.29774,0.639422,67.5349,157.943,1261655, "neutral"},
		{"ecoospoo",60,1.1,0.639421,66.3,33.001,1261655, "conversation"},
		{"poki_wirqi",60,-29.0928,1.63942,52.3406,180.009,1261660, "conversation"},
		{"awwaschlu_witubrarq",60,-29.0928,1.63942,51.3406,0,1261660, "conversation"},
		{"farmer",60,-50.0859,2.63942,33.6967,135.008,1261663, "conversation"},
		{"businessman",300,-48.9859,2.63942,33.6967,180.011,1261663, "conversation"},
		{"farmer_rancher",60,-49.1,2.6,32.5,-36,1261663, "happy"},
		{"trainer_shipwright",60,-3.2,0.6,67.7,177,1261655, "neutral"},

		--Tavern -2888 2281
		{"scientist",60,-2.1,1,9.1,-26,3065452, "calm"},
		{"r5",60,1.5,1,7.5,-82,3065452, ""},
		{"info_broker",60,5.7,1,4.2,0,3065450, "happy"},
		{"patron_chiss",60,9.7,0.4,-3.2,1,3065451, ""},
		{"patron_devaronian",60,9.6,0.4,-1.4,172,3065451, "conversation"},
		{"commoner_fat",60,4.3,0.4,-9.8,-12,3065451, "nervous"},
		{"rancher",60,-2.5,0.4,-9.8,-177,3065451, ""},
		{"judge",60,-10.6,0.4,-2.1,71,3065451, "npc_accusing"},
		{"entertainer",60,4.3,-3.4,4.4,-100,3065456, ""},
		{"patron_ithorian",60,1.5,-4,4.3,86,3065456, "entertained"},
		{"imperial_recruiter",60,-9.3,-9.5,-3.2,-15,3065458, ""},
		{"twilek_slave",60,-4.2,-10,-6.5,-94,3065459, "nervous"},
		{"farmer_rancher",60,-4.3,-10,-8.2,-78,3065459, ""},
		{"businessman",60,-5.8,-10,-7.1,73,3065459, "npc_consoling"},

		--large Tatooine house with Krayt skull above door
		{"shadowy_figure",60,0,0.5,-6.9,180,1261454, "angry"},
		{"r4",60,-1.9,1.0,5.9,130,1261454, ""},
		{"r4",60,1.9,1.0,5.9,-130,1261454, ""},
		{"mercenary",300,-6.9,2.0,10,100,1261453, "npc_accusing"},
		{"mercenary",300,6.9,2.0,10,-100,1261453, "npc_accusing"},
		{"bounty_hunter", 1, 2.3, 0.5, -10.0, 0, 1261454, ""},
		{"imperial_exterminator", 300, -2.3, 0.5, -10.0, 0, 1261454, ""},

		--southwest Tavern
		{"vendor",60,10,0.4,-5.5,85,1261582, "npc_use_terminal_high"},
		{"scientist",60,4.6,0.4,1.7,0,1261582, ""},
		{"patron_ishitib",60,-4.5,0.4,-5.5,-40,1261582, ""},
		{"patron_klaatu",60,-5.1,0.4,-4.3,149,1261582, "conversation"},
		{"contractor",60,-6.5,-4.0,-6.8,-90,1261586, "worried"},
		{"commoner_technician",300,-6.3,-4.0,-5.9,-112,1261586, "sad"},

		--west Tavern
		{"commoner_naboo",60,-3.6,1.0,9.3,0,1261570, ""},
		{"commoner_tatooine",60,6.9,0.4,-9.1,180,1261569, ""},
		{"agriculturalist",60,-2.7,0.4,-1.7,75,1261569, "conversation"},
		{"rancher",60,-1.0,0.4,-1.6,-90,1261569, ""},
		{"farmer_rancher",60,-2.2,0.4,-0.9,171,1261569, ""},
		{"farmer",60,-2.0,0.4,-2.3,0,1261569, ""},
		{"chiss_female",60,9.7,-9.5,-10.0,-45,1261579, ""},
		{"noble",60,3.8,-9.5,1.4,-100,1261579, ""},
		{"surgical_droid_21b",60,-1.9,-9.5,-6.5,90,1261579, ""},
		{"surgical_droid_21b",60,7.5,-9.5,-10.1,102,1261579, ""},
		{"chiss_male",60,8.8,-9.5,-6.7,145,1261579, "sad"},

		--Guild Hall -2857 1987
		{"contractor",60,-3.69,1.13306,-6,11.0003,1256306, ""},
		{"miner",60,3.29,1.13306,-9.58,249.007,1256011, ""},
		{"trainer_artisan",0,-0.0885271,1.13306,-14.0283,2,1256011, ""},

		--Cantina
		{"dorn_gestros",60,-6.00754,-0.894992,-5.35219,231.068,1256058, "calm"},
		{"medic",60,12.1732,-0.894991,3.93609,180.003,1256058, "conversation"},
		{"sullustan_male",300,12.1732,-0.894992,2.93609,360.011,1256058, "conversation"},
		{"bounty_hunter",300,2.1656,-0.894992,-15.9672,360.011,1256061, "calm"},
		{"contractor",60,2.1656,-0.894992,-14.9672,180.001,1256061, "conversation"},
		{"commoner_tatooine",60,-20.6545,-0.894989,25.0112,0,1256067, "conversation"},
		{"noble",300,-20.6545,-0.894989,26.0112,180.01,1256067, "conversation"},
		{"da_la_socuna",60,-29.7168,-0.519991,7.77728,54.7476,1256068, "conversation"},

		--Guild Hall -3063 2079
		{"trainer_architect",0,11,1.133,-14.5,0,1256021, ""},
		{"trainer_armorsmith",0,-12.5142,1.13306,3.63893,165,1256020, ""},
		{"trainer_droidengineer",0,-11.5362,1.13306,-12.6351,1,1256023, ""},
		{"trainer_weaponsmith",0,-2.95975,1.13306,-8.77207,109,1256022, ""},
		{"trainer_merchant",0,12,1.13306,6,180,1256019, ""},

		--Med Center
		{"trainer_combatmedic",0,7.93319,0.184067,5.54261,86,4005424, ""},

		--Hotel
		{"commoner_technician",300,20.2715,1.28309,-1.14578,360.011,1261018, "conversation"},
		{"noble",60,20.2715,1.28309,-0.0457823,179.998,1261018, "conversation"},
		{"medic",300,19.1715,1.28309,-0.0457823,134.998,1261018, "conversation"},
		{"scientist",60,20.3,1.6,13.7,-5,1261018, ""},
		{"mercenary",300,7.41432,1.00001,-5.80893,180.003,1261017, "angry"},
		{"commoner_technician",300,7.41432,1.00001,-6.90893,0,1261017, "conversation"},

		--Junk Shop
		{"junk_nado", 0, 1.2, -0.5, 5.5, -144, 1255997, ""},

		--Guild Hall -2997 2426
		{"trainer_brawler",0,-11,1.1,-14,0,1255994, ""},
		{"trainer_marksman",0,0,1.13306,-13,0,1255993, ""},
		{"trainer_scout",0,-13,1.1,4.8,180,1255991, ""},
		{"junk_dealer", 0, -14.3, 1.1, 2.9, 105, 1255991, ""},

		--Outside
		{"anim_kahn",60,-2907.07,5,2130.14, 75,0, "neutral"},
		{"criminal",300,-2960.96,5,2163.64,79.2954,0, ""},
		{"criminal",300,-2856.83,5,2473.55,184.191,0, ""},
		{"criminal",300,-2976.77,5,2539.28,36.1265,0, ""},
		{"criminal",300,-2837.3,5,2425.05,254.096,0, ""},
		{"criminal",300,-2760.75,5,2038.95,263.963,0, ""},
		{"criminal",300,-2834.04,5,2462.23,193.677,0, ""},
		{"criminal",300,-2846.59,5,2497.64,332.133,0, ""},
		{"desert_demon",300,-2821.38,5,2432.95,176.513,0, ""},
		{"desert_demon",300,-2861.27,5,2393.34,146.859,0, ""},
		{"desert_demon",300,-2823.03,5,2448.69,64.4102,0, ""},
		{"informant_npc_lvl_1",0,-2804,5,2237,315,0, ""},
		{"informant_npc_lvl_1",0,-2836,5,2275,45,0, ""},
		{"informant_npc_lvl_1",0,-2935,5,2393,90,0, ""},
		{"informant_npc_lvl_2",0,-2879,5,2555,135,0, ""},

		--Jawa's
		{"jawa",300,-2930.03,5,2038.02,270.008,0, "conversation"},
		{"jawa",300,-2932.03,5,2038.02,90.0027,0, "conversation"},
		{"jawa",300,-2931.03,5,2037.02,0,0, "conversation"},
		{"jawa",300,-3033.6,5,2245.5,80,0, ""},
		{"jawa",300,-3028.7,5,2246.4,-99,0, ""},
		{"jawa",300,-2997.5,5,2246.5,-83,0, ""},
		{"jawa",300,-2921.8,5,2561,-17,0, ""},
		{"jawa",300,-2922.7,5,2565.1,167,0, ""},
		{"jawa",300,-2918.3,5,2587.5,-147,0, ""},
		{"jawa",300,-2923.6,5,2579.2,24,0, ""},
		{"jawa",300,-2888,5,2591,90.7367,0, ""},
		{"jawa",300,-2886.7,5,2591,-90,0, ""},
		{"jawa",300,-2854.7,5,2461.1,-77,0, ""},
		{"jawa",300,-2857,5,2461.6,112,0, ""},
		{"jawa",300,-2820.6,5,2414.3,-6,0, ""},
		{"jawa",300,-2821,5,2417.3,154,0, ""},
		{"jawa",300,-2842.4,5,2317.4,-132,0, ""},
		{"jawa",300,-2844.9,5,2315.3,49,0, ""},
		{"jawa",300,-2866.7,5,2311.8,-51,0, ""},
		{"jawa",300,-2869.2,5,2314,140,0, ""},
		{"jawa",300,-2737.2,5,2179.2,-12,0, ""},
		{"jawa",300,-2736.3,5,2181.5,-97,0, ""},
		{"jawa",300,-2737.7,5,2183.6,169,0, ""},
		{"jawa_engineer",300,-2834.7,5,2399,76,0, ""},
		{"jawa_engineer",300,-2771.4,5,1934.2,84,0, ""},
		{"jawa_engineer",300,-2735,5,2189.5,-116,0, ""},
		{"jawa_engineer",300,-2742.4,5,2175.1,78,0, ""},
		{"jawa_healer",300,-2866.1,5,2465.9,-33,0, ""},
		{"jawa_healer",300,-2830.7,5,2400,-111,0, ""},
		{"jawa_healer",300,-2775.7,5,1925,2,0, ""},
		{"jawa_healer",300,-2775.8,5,1931.4,54,0, ""},
		{"jawa_healer",300,-2773.3,5,1932.7,-122,0, ""},
		{"jawa_healer",300,-2775.5,5,1927.9,-176,0, ""},
		{"jawa_healer",300,-2766.8,5,1934,-95,0, ""},
		{"jawa_henchman",300,-2906.1,5,2594.7,103,0, ""},
		{"jawa_smuggler",300,-3002.1,5,2245.9,77,0, ""},
		{"jawa_smuggler",300,-2775.8,5,1918.2,152,0, ""},
		{"jawa_smuggler",300,-2776.8,5,1913.8,78,0, ""},
		{"jawa_thief",300,-2903,5,2594.2,-80,0, ""},
		{"jawa_thief",300,-2867.9,5,2468,144,0, ""},
		{"jawa_thief",300,-2867.6,5,2421.4,-130,0, ""},
		{"jawa_thief",300,-2848.8,5,2430.5,103,0, ""},
		{"jawa_thief",300,-2739.1,5,2175.5,-96,0, ""},
		{"jawa_thief",300,-2736.1,5,2188.86,69.1613,0, ""},

		--More misc outside
		{"junk_dealer", 0, -2750.9, 5, 2057, 132, 0, ""},
		{"junk_dealer", 0, -2904.51, 5, 2446.5, -87, 0, ""},
		{"miner",60,-2918.94,5,2170.6,180.005,0, "conversation"},
		{"mouse_droid", 0, 8.3, -9.5, -7.3, 135, 1261579, ""},
		{"noble",60,-2924.82,5,2143.27,127.261,0, ""},
		{"noble",60,-3081.03,5,2104.52,341.726,0, ""},
		{"noble",60,-3064.8,5,2095.01,-130,0, ""},
		{"noble",60,-2999.41,5.52789,2350.79,244.987,0, ""},
		{"noble",60,-2847.77,5,2393.35,42.0583,0, ""},
		{"noble",60,-2810.65,5,2195.86,318.004,0, ""},
		{"noble",60,-3091.67,5,2165.61,286.75,0, ""},
		{"noble",60,-3062.85,5,2195.92,156.151,0, ""},
		{"prost_roberts", 60, -2906.52,5,2128.41, 75, 0, "neutral"},
		{"rel_keteris", 60, -2905.83, 5, 2127.11, 75, 0, "neutral"},
		{"scientist",60,-2969.77,5,2194.82,198.34,0, ""},
		{"scientist",60,-3055.28,5,2098.76,237.173,0, ""},
		{"scientist",60,-2913.31,5,2566.89,167.24,0, ""},
		{"scientist",60,-2969.78,5,2469.4,58.2554,0, ""},
		{"scientist",60,-2860.55,5,2534.77,227.149,0, ""},
		{"thug",300,-2857.9,5,2250.18,156.767,0, ""},
		{"thug",300,-2731.61,5,2242.41,339.94,0, ""},
		{"thug",300,-2748.23,5,2031.47,337.983,0, ""},
		{"thug",300,-2794.64,5,2327.09,109.693,0, ""},
		{"thug",300,-2927.54,5,2013.85,322.05,0, ""},
		{"thug",300,-2994.3,5.5,2331.4,165,0, ""},
		{"thug",300,-2964.35,5,2536.74,244.766,0, ""},
		{"thug",300,-3065.25,5,2142.42,155.455,0, ""},
		{"thug",300,-2919.38,5,2143.08,304.531,0, ""},
		{"trace_lyson",60,-2909.17,5,2180.03,180,0, "calm"},
		{"trainer_1hsword",0,-2964,5,2021,33,0, ""},
		{"trainer_2hsword",0,-2971,5,2032,174,0, ""},
		{"trainer_architect",0,-2872,5,2159,180,0, ""},
		{"trainer_artisan",0,-2890,5,2142,19,0, ""},
		{"trainer_brawler",0,-2933,5,2125,97,0, ""},
		{"trainer_creaturehandler",0,-2994,5,2530,0,0, ""},
		{"trainer_doctor",0,-3163.63,5,2122.39,18,0, ""},
		{"trainer_entertainer",0,-2889,5,2178,161,0, ""},
		{"trainer_marksman",0,-2931,5,2121,91,0, ""},
		{"trainer_medic",0,-3158,5,2122,5,0, ""},
		{"trainer_medic",0,-2931,5,2116,65,0, ""},
		{"trainer_musician",0,-2882,5,2171,180,0, ""},
		{"trainer_polearm",0,-2931,5,2386,0,0, ""},
		{"trainer_scout",0,-2912.86,5,2106.67,174,0, ""},
		{"trainer_unarmed",0,-2812,5,1973,180,0, ""},
		{"trainer_weaponsmith",0,-2869,5,2146,8,0, ""}
	}
}

registerScreenPlay("TatooineMosEspaScreenPlay", true)

function TatooineMosEspaScreenPlay:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
		self:spawnPatrolMobiles()
		self:spawnStationaryMobiles()
		self:spawnSceneObjects()
		self:spawnGcwMobiles()
	end
end

function TatooineMosEspaScreenPlay:spawnSceneObjects()
	--outside starport
	spawnSceneObject(self.planet, "object/tangible/crafting/station/public_space_station.iff", -2930.39, 5, 2134.35, 0, math.rad(130) )
	spawnSceneObject(self.planet, "object/tangible/crafting/station/public_space_station.iff", -2879.34, 5, 2164.2, 0, math.rad(-140) )

	--inside Tavern, north of starport
	spawnSceneObject(self.planet, "object/static/structure/general/droid_droideka_powerdown.iff", -6.40696, -3.96617, -6.78822, 3065455, 0.958853, 0, 0, 0.283905)
	spawnSceneObject(self.planet, "object/tangible/furniture/decorative/microphone_s02.iff", 6.89479, -3.36756, 8.70603, 3065456, 0, 0, 0, 0)
	spawnSceneObject(self.planet, "object/tangible/furniture/decorative/park_bench.iff", -10.1908, -3.96617, 6.0145, 3065456, math.rad(90) )
	spawnSceneObject(self.planet, "object/tangible/furniture/all/frn_all_bed_lg_s2.iff", -7.40007, -9.99298, -8.64868, 3065459, 0, 0, 0, 0)
	spawnSceneObject(self.planet, "object/tangible/furniture/decorative/pitcher_full.iff", -11.1833, -9.99311, -10.1457, 3065459, 0, 0, 0, 0)
	spawnSceneObject(self.planet, "object/tangible/furniture/modern/rug_oval_sml_s01.iff", -7.13995, -9.9929, -7.33483, 3065459, math.rad(90) )

	--inside Large Tatooine House with Krayt skull above door
	spawnSceneObject(self.planet, "object/tangible/furniture/all/frn_all_desk_radar_topology_screen.iff", 0.211172, 0.512662, -10.9995, 1261454, 0, 0, 0, 0)
	spawnSceneObject(self.planet, "object/tangible/painting/painting_luke_wanted.iff", 4.34762, 0.512662, -10.997, 1261454, 0, 0, 0, 0)
	spawnSceneObject(self.planet, "object/tangible/painting/painting_leia_wanted.iff", -4.34762, 0.512662, -10.997, 1261454, 0, 0, 0, 0)
	spawnSceneObject(self.planet, "object/tangible/furniture/imperial/data_terminal_s2.iff", 2.31777, 0.512662, -11.0014, 1261454, 0, 0, 0, 0)
	spawnSceneObject(self.planet, "object/tangible/furniture/imperial/data_terminal_s2.iff", -2.31777, 0.512662, -11.0014, 1261454, 0, 0, 0, 0)
	spawnSceneObject(self.planet, "object/tangible/furniture/all/frn_all_rug_rectangle_large_style_05.iff", -0.0, 0.5, -3.1, 1261454, math.rad(90) )
	spawnSceneObject(self.planet, "object/tangible/furniture/modern/dining_table_modern_style_01.iff", -0.0, 0.5, -3.1, 1261454, math.rad(0) )
	spawnSceneObject(self.planet, "object/tangible/furniture/all/frn_all_chair_upholstered_s1.iff", -0.0, 1.0, 7.5, 1261454, math.rad(180) )
	spawnSceneObject(self.planet, "object/static/structure/tatooine/skeleton_greater_krayt_head.iff", -2.6, 1.0, 6.5, 1261454, math.rad(130) )
	spawnSceneObject(self.planet, "object/static/structure/tatooine/skeleton_greater_krayt_head.iff", 2.6, 1.0, 6.5, 1261454, math.rad(-130) )
	spawnSceneObject(self.planet, "object/tangible/furniture/all/frn_all_tiki_torch_s1.iff", -0.5, 1.0, 7.5, 1261454, 0, 0, 0, 0)
	spawnSceneObject(self.planet, "object/tangible/furniture/all/frn_all_tiki_torch_s1.iff", 0.5, 1.0, 7.5, 1261454, 0, 0, 0, 0)
	spawnSceneObject(self.planet, "object/tangible/furniture/tatooine/frn_tatt_cantina_droid_detector.iff", -14.5, 1.0, -3.3, 1261454, math.rad(90) )
	spawnSceneObject(self.planet, "object/tangible/furniture/tatooine/frn_tatt_cantina_droid_detector.iff", 12.5, 1.0, -3.3, 1261454, math.rad(-90) )
	spawnSceneObject(self.planet, "object/tangible/furniture/all/bestine_quest_imp_banner.iff", 0, 2.0, 8.5, 1261453, math.rad(90) )
	spawnSceneObject(self.planet, "object/static/structure/general/droid_probedroid_powerdown.iff", 1.0, -4.0, -7.9, 1718407, math.rad(-90) )

	--southwest Tavern
	spawnSceneObject(self.planet, "object/tangible/furniture/all/frn_all_professor_desk.iff", -7.0, -4.0, -6.5, 1261586, math.rad(90) )
	spawnSceneObject(self.planet, "object/tangible/furniture/all/bestine_quest_statue.iff", 0.2, -4.0, -10.4, 1261586, math.rad(-50) )

	--west Tavern
	spawnSceneObject(self.planet, "object/static/structure/general/banner_tatooine_style_01.iff", -11.0, 0.4, -1.5, 1261569, math.rad(90) )
	spawnSceneObject(self.planet, "object/tangible/furniture/all/frn_all_tiki_torch_s1.iff", -10.6, -1.4, -10.2, 1261572, math.rad(43) )
	spawnSceneObject(self.planet, "object/tangible/furniture/all/frn_all_tiki_torch_s1.iff", 0.2, -4.0, -10.4, 1261573, math.rad(-53) )
	spawnSceneObject(self.planet, "object/tangible/furniture/all/frn_all_tiki_torch_s1.iff", -11.2, -9.5, 1.8, 1261576, math.rad(130) )
	spawnSceneObject(self.planet, "object/tangible/furniture/all/frn_all_tiki_torch_s1.iff", -1.0, -9.5, 1.8, 1261576, math.rad(36) )
	spawnSceneObject(self.planet, "object/tangible/item/quest/force_sensitive/bacta_tank.iff", -1.9, -9.5, -4.3, 1261579, math.rad(90) )
	spawnSceneObject(self.planet, "object/tangible/item/quest/force_sensitive/bacta_tank.iff", -1.9, -9.5, -8.6, 1261579, math.rad(90) )
	spawnSceneObject(self.planet, "object/tangible/item/quest/force_sensitive/bacta_tank.iff", 9.7, -9.5, -10.0, 1261579, math.rad(-45) )
	spawnSceneObject(self.planet, "object/tangible/furniture/technical/armoire_s01.iff", 5.5, -9.5, -11.0, 1261579, math.rad(0) )
end

function TatooineMosEspaScreenPlay:spawnMobiles()
	local mobiles = self.mobiles

	for i = 1, #mobiles, 1 do
		local mob = mobiles[i]

		-- {template, respawn, x, z, y, direction, cell, mood}
		local pMobile = spawnMobile(self.planet, mob[1], mob[2], mob[3], mob[4], mob[5], mob[6], mob[7])

		if (pMobile ~= nil) then
			if mob[8] ~= "" then
				CreatureObject(pMobile):setMoodString(mob[8])
			end

			AiAgent(pMobile):addObjectFlag(AI_STATIC)

			if CreatureObject(pMobile):getPvpStatusBitmask() == 0 then
				CreatureObject(pMobile):clearOptionBit(AIENABLED)
			end
		end
	end

	local pNpc = spawnMobile(self.planet, "jawa", -1, -1.1, 1.0, 9.5, math.rad(-90), 1261583)

	if (pNpc ~= nil) then
		CreatureObject(pNpc):setPvpStatusBitmask(0)
	end

	--Creatures
	--[[
	spawnMobile(self.planet, "dwarf_eopie",300,-3217.87,6.7851,2010.86,329.47,0)
	spawnMobile(self.planet, "dwarf_eopie",300,-3205.35,6.01035,2016.06,32.4216,0)
	spawnMobile(self.planet, "dwarf_eopie",300,-3208.98,6.12053,2017.03,118.154,0)
	spawnMobile(self.planet, "dwarf_eopie",300,-3246.28,5.42038,2218.4,130.138,0)
	spawnMobile(self.planet, "dwarf_eopie",300,-3248.94,5.4228,2116.77,343.61,0)
	spawnMobile(self.planet, "dwarf_eopie",300,-2789.62,6.17824,1763.98,98.5487,0)
	spawnMobile(self.planet, "dwarf_eopie",300,-2797.01,5.38467,1764.85,345.893,0)
	spawnMobile(self.planet, "dwarf_eopie",300,-2713.99,5.73621,1815.47,199.28,0)
	spawnMobile(self.planet, "dwarf_eopie",300,-2705.64,5.75105,1820.1,188.657,0)
	spawnMobile(self.planet, "dwarf_eopie",300,-2720.95,5.12037,1838.72,69.0059,0)
	spawnMobile(self.planet, "dwarf_eopie",300,-3114.39,5.75482,1906.64,235.346,0)
	spawnMobile(self.planet, "dwarf_eopie",300,-3093.11,5.06432,1912.45,117.788,0)
	spawnMobile(self.planet, "dwarf_eopie",300,-3006.66,7.83559,2697.94,246.037,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2868.66,5.92974,2659.77,280.728,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2879.16,5.3938,2642.48,208.517,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2957.17,6.65151,2663.78,200.677,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2958.99,6.05473,2651.86,35.5292,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2954.14,5.93401,2648.89,80.4338,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2959.73,6.48665,2662.19,351.646,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2599.04,5.20143,2338.05,44.6433,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2592.54,5.37076,2333.19,191.631,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2593.9,5,2038.48,159.546,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2599.47,5,2034.19,249.173,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2626.73,5.0133,1962.54,9.62294,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-3248.78,5.22997,2122.05,130.343,0)
	spawnMobile(self.planet, "lesser_desert_womp_rat",300,-3210.83,6.40006,2005.31,323.114,0)
	spawnMobile(self.planet, "lesser_desert_womp_rat",300,-3244.16,6.56426,2232.65,151.289,0)
	spawnMobile(self.planet, "lesser_desert_womp_rat",300,-3095.72,5.05761,1915.26,68.165,0)
	spawnMobile(self.planet, "lesser_desert_womp_rat",300,-2594.47,5,2219.41,202.753,0)
	spawnMobile(self.planet, "lesser_desert_womp_rat",300,-2613.3,5.16549,1956.6,191.904,0)
	spawnMobile(self.planet, "lesser_desert_womp_rat",300,-3113.6,5.65245,1908.34,35.3904,0)
	spawnMobile(self.planet, "minor_worrt",300,-3241.57,5.39865,2216.06,297.723,0)
	spawnMobile(self.planet, "minor_worrt",300,-3258.59,5.19927,2132.91,298.091,0)
	spawnMobile(self.planet, "minor_worrt",300,-3096.16,5.08975,1913.67,167.708,0)
	spawnMobile(self.planet, "minor_worrt",300,-3108.76,5.45396,1910.17,6.74715,0)
	spawnMobile(self.planet, "minor_worrt",300,-3012.17,7.90734,2691.38,235.115,0)
	spawnMobile(self.planet, "minor_worrt",300,-2998.58,7.10669,2701.67,51.6869,0)
	spawnMobile(self.planet, "minor_worrt",300,-3074.46,6.07262,2617.97,336.772,0)
	spawnMobile(self.planet, "minor_worrt",300,-3069.16,5.91533,2614.47,71.6097,0)
	spawnMobile(self.planet, "minor_worrt",300,-2878.72,5.73483,2655.63,201.074,0)
	spawnMobile(self.planet, "minor_worrt",300,-2961.46,5.95319,2651.28,282.92,0)
	spawnMobile(self.planet, "minor_worrt",300,-2590.93,5,2218.28,295.223,0)
	spawnMobile(self.planet, "minor_worrt",300,-2586.74,5.44835,2327.16,227.993,0)
	spawnMobile(self.planet, "minor_worrt",300,-2579.03,5.26702,2042.14,89.1564,0)
	spawnMobile(self.planet, "minor_worrt",300,-2633.43,5.01395,1952.51,234.757,0)
	spawnMobile(self.planet, "minor_worrt",300,-2618.22,5.11747,1957.43,96.8282,0)
	spawnMobile(self.planet, "minor_worrt",300,-3257.35,5.46191,2118.72,178.577,0)
	spawnMobile(self.planet, "minor_worrt",300,-3068.78,6.01769,2624.45,350.333,0)
	spawnMobile(self.planet, "minor_worrt",300,-3073.79,6.05983,2617.18,335.476,0)
	spawnMobile(self.planet, "mound_mite",300,-3174.62,8.58522,1889.76,275.616,0)
	spawnMobile(self.planet, "mound_mite",300,-3321.03,6.78999,2187.04,121.37,0)
	spawnMobile(self.planet, "mound_mite",300,-3224.53,4.79097,1931.72,159.513,0)
	spawnMobile(self.planet, "mound_mite",300,-2922.41,8.03007,2711.74,325.617,0)
	spawnMobile(self.planet, "mound_mite",300,-2921.7,7.7918,2717.75,338.017,0)
	spawnMobile(self.planet, "mound_mite",300,-2909.38,7.75577,2704.39,256.038,0)
	spawnMobile(self.planet, "mound_mite",300,-2791.98,6.24406,1759.43,250.163,0)
	spawnMobile(self.planet, "mound_mite",300,-2485.1,7.2,2148.3,-33,0)
	spawnMobile(self.planet, "mound_mite",300,-2492.4,7,2150.2,-5,0)
	spawnMobile(self.planet, "mound_mite",300,-2977.98,5.61491,2651.49,216.494,0)
	spawnMobile(self.planet, "mound_mite",300,-2591.43,5.32223,2342.79,267.897,0)
	spawnMobile(self.planet, "mound_mite",300,-2595.01,5,2036.52,108.932,0)
	spawnMobile(self.planet, "mound_mite",300,-2488.3,6.82684,2159.7,-178,0)
	spawnMobile(self.planet, "mound_mite",300,-2491.39,6.83135,2156.44,337.917,0)
	spawnMobile(self.planet, "mound_mite",300,-2485.06,7.15469,2153.94,143.47,0)
	spawnMobile(self.planet, "rill",300,-3204.8,5.93603,2007.91,60.4885,0)
	spawnMobile(self.planet, "rill",300,-3207.4,5.68534,2028.55,27.7763,0)
	spawnMobile(self.planet, "rill",300,-3249.68,5.837,2224.78,186.126,0)
	spawnMobile(self.planet, "rill",300,-3232.15,6.18538,2232.39,115.466,0)
	spawnMobile(self.planet, "rill",300,-3252.78,6.52437,2230.5,245.072,0)
	spawnMobile(self.planet, "rill",300,-3250.93,5.68002,2105.16,193.916,0)
	spawnMobile(self.planet, "rill",300,-2795.61,5.42368,1767.23,216.636,0)
	spawnMobile(self.planet, "rill",300,-2795.65,6.41057,1752.01,160.826,0)
	spawnMobile(self.planet, "rill",300,-2723.39,5.02906,1842.49,350.515,0)
	spawnMobile(self.planet, "rill",300,-2724.42,5.34057,1826.85,328.592,0)
	spawnMobile(self.planet, "rill",300,-3064.46,5.7272,2615.22,74.3472,0)
	spawnMobile(self.planet, "rill",300,-2872.34,5.55843,2645.44,257.186,0)
	spawnMobile(self.planet, "rill",300,-2956.31,5.85355,2647.42,135.445,0)
	spawnMobile(self.planet, "rill",300,-2593.87,5,2226.87,289.139,0)
	spawnMobile(self.planet, "rill",300,-2590.52,5,2218.13,127.958,0)
	spawnMobile(self.planet, "rill",300,-2585.79,5.0883,2035.52,136.404,0)
	spawnMobile(self.planet, "rill",300,-3108.03,5.62114,1896.46,169.483,0)
	spawnMobile(self.planet, "rockmite",300,-3238.87,6.19092,2231.04,313.88,0)
	spawnMobile(self.planet, "rockmite",300,-3238.91,6.14088,2230.72,103.109,0)
	spawnMobile(self.planet, "rockmite",300,-3246.74,5.19249,2121.66,161.991,0)
	spawnMobile(self.planet, "rockmite",300,-3316.94,8.07518,2198.91,167.512,0)
	spawnMobile(self.planet, "rockmite",300,-3321.67,8.2476,2207.22,280.722,0)
	spawnMobile(self.planet, "rockmite",300,-2909.86,7.8253,2692.86,105.782,0)
	spawnMobile(self.planet, "rockmite",300,-2714.58,5.37967,1828.84,245.32,0)
	spawnMobile(self.planet, "rockmite",300,-2863.93,5.69244,2645.23,193.813,0)
	spawnMobile(self.planet, "rockmite",300,-2871.32,5.43329,2638.84,167.571,0)
	spawnMobile(self.planet, "rockmite",300,-2883.89,5.34137,2636.44,218.56,0)
	spawnMobile(self.planet, "rockmite",300,-2590.42,5,2212.03,168.759,0)
	spawnMobile(self.planet, "rockmite",300,-2601.23,5.0058,2320.44,217.298,0)
	spawnMobile(self.planet, "rockmite",300,-2591.62,5,2039.11,328.105,0)
	spawnMobile(self.planet, "rockmite",300,-2591.7,5.28616,2031.4,-72,0)
	spawnMobile(self.planet, "rockmite",300,-2633.87,5,1974.12,180.868,0)
	spawnMobile(self.planet, "rockmite",300,-3080.79,6.03743,2611.32,274.602,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2775.96,5,2483.96,160.007,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2795.9,5,2465.26,234.054,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2738.08,7.0857,2593.59,10.0957,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2814.11,5,2564.44,351.252,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2704.69,5,2447,144.669,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2681.63,5,2446.35,49.6666,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2776.92,5,2519.58,127.489,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2727.05,5,2452.36,233.461,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2708.25,5,2502.65,33.3582,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2712.84,5,2531.4,66.9802,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2724.24,5,2493.81,125.127,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2759.53,5,2452.82,285.438,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2725.86,5,2448.69,319.256,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2672.59,5,2453.01,205.972,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2702.54,5,2484.93,263.207,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2686.76,5,2433.69,241.59,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2723.47,5,2516.85,226.256,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2723.69,5,2481,27.9293,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2674.03,5.08911,2516.33,146.077,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2753.85,5,2515.57,287.643,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2689.61,5,2510.66,127.468,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2712.54,5,2478.41,328.789,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2783.56,5,2547.41,274.367,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2770.34,5,2507.88,282.073,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2688.24,5.18783,2540.25,306.662,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2697.2,5.68001,2579.61,60.858,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2660.7,5.26786,2500.87,151.217,0)
	spawnMobile(self.planet, "tatooine_mynock",300,-2674.79,5,2495.31,90.1322,0)
	spawnMobile(self.planet, "tempest_rill",300,-2800,6.1,1756.1,-76,0)
	spawnMobile(self.planet, "womp_rat",300,-3204.49,5.96378,2015.95,36.2798,0)
	spawnMobile(self.planet, "womp_rat",300,-3265.58,5.20889,2129.95,295.349,0)
	spawnMobile(self.planet, "womp_rat",300,-2963.31,6.41839,2664.35,19.3742,0)
	spawnMobile(self.planet, "womp_rat",300,-2593.13,5,2213.37,141.78,0)
	spawnMobile(self.planet, "womp_rat",300,-2581.69,5.15777,2031.96,201.278,0)
	spawnMobile(self.planet, "womp_rat",300,-2621.59,5.02486,1967.45,345.653,0)
	spawnMobile(self.planet, "womp_rat",300,-3103.38,5.15501,1918.82,259.068,0)
	spawnMobile(self.planet, "worrt",300,-3177.72,8.08039,1907.34,336.463,0)
	spawnMobile(self.planet, "worrt",300,-3172.01,8.51885,1888.24,357.926,0)
	spawnMobile(self.planet, "worrt",300,-3173.18,8.36948,1901.38,300.936,0)
	spawnMobile(self.planet, "worrt",300,-3213.79,6.5217,2012.58,328.593,0)
	spawnMobile(self.planet, "worrt",300,-3253.53,5.24487,2125.54,105.424,0)
	spawnMobile(self.planet, "worrt",300,-3337.76,7.3219,2207.57,236.021,0)
	spawnMobile(self.planet, "worrt",300,-3242.18,5.11691,1949.38,349.239,0)
	spawnMobile(self.planet, "worrt",300,-3227.98,4.76563,1939.4,297.068,0)
	spawnMobile(self.planet, "worrt",300,-3243.03,5.88032,1922.89,185.988,0)
	spawnMobile(self.planet, "worrt",300,-2716.18,5.32138,1830.71,264.114,0)
	spawnMobile(self.planet, "worrt",300,-3010.7,8.06339,2696.54,355.815,0)
	spawnMobile(self.planet, "worrt",300,-3075.74,6.01681,2609.75,341.395,0)
	spawnMobile(self.planet, "worrt",300,-2867.04,5.66638,2645.57,311.095,0)
	spawnMobile(self.planet, "worrt",300,-2594.32,5,2215.81,184.003,0)
	spawnMobile(self.planet, "worrt",300,-2589.82,5,2226.13,110.267,0)
	spawnMobile(self.planet, "worrt",300,-2613.31,5.08118,1969.82,347.531,0)
	spawnMobile(self.planet, "worrt",300,-2628.18,5.04651,1955.15,351.895,0)
	]]
end
