-- Orgrimmar - Valley of Honor
SET @CGUID := 375474;
SET @OLDCGUID := 685;
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+116;
DELETE FROM `creature` WHERE `guid` BETWEEN @OLDCGUID+0 AND @OLDCGUID+116;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@CGUID+0, 31146, 1, 1, 2118.74, -4623.69, 49.32983, 2.565634, 120, 0, 0), -- Raider's Training Dummy (Area: -Unknown-) (Auras: 61573 - Banner of the Alliance)
(@CGUID+1, 3352, 1, 1, 2106.94, -4616.56, 49.33633, 1.884956, 120, 0, 0), -- Ormak Grimshot (Area: -Unknown-)
(@CGUID+2, 47815, 1, 1, 2104.46, -4618.06, 49.33623, 2.286381, 120, 0, 0), -- Grimfang (Area: -Unknown-)
(@CGUID+3, 47818, 1, 1, 2110.97, -4610.88, 49.33633, 4.08407, 120, 0, 0), -- Tusker (Area: -Unknown-)
(@CGUID+4, 46647, 1, 1, 2126.25, -4599.05, 49.33633, 3.874631, 120, 0, 0), -- Training Dummy (Area: -Unknown-) (Auras: 61573 - Banner of the Alliance)
(@CGUID+5, 47767, 1, 1, 2107.56, -4611.76, 49.33633, 3.979351, 120, 0, 0), -- Korla (Area: -Unknown-)
(@CGUID+6, 31755, 1, 1, 2073.01, -4618.06, 49.28975, 2.268928, 120, 0, 0), -- Stabled Hunter Pet (Area: Valley of Honor)
(@CGUID+7, 46647, 1, 1, 2081.63, -4607.98, 49.33633, 5.951573, 120, 0, 0), -- Training Dummy (Area: Valley of Honor) (Auras: 61573 - Banner of the Alliance)
(@CGUID+9, 46640, 1, 1, 2068.53, -4666.77, 34.10643, 3.368485, 120, 0, 0), -- Auctioneer Kuvi (Area: Valley of Honor)
(@CGUID+11, 31146, 1, 1, 2098.6, -4627.86, 49.33633, 0.7853982, 120, 0, 0), -- Raider's Training Dummy (Area: Valley of Honor) (Auras: 61573 - Banner of the Alliance)
(@CGUID+13, 47788, 1, 1, 2102.71, -4613.35, 49.33633, 6.195919, 120, 0, 0), -- Guldor (Area: Valley of Honor)
(@CGUID+14, 46647, 1, 1, 2110.68, -4590.13, 49.33633, 4.520403, 120, 0, 0), -- Training Dummy (Area: Valley of Honor) (Auras: 61573 - Banner of the Alliance)
(@CGUID+15, 47817, 1, 1, 2102.99, -4608.63, 49.33633, 0, 120, 0, 0), -- Scuttler (Area: Valley of Honor)
(@CGUID+16, 3296, 1, 1, 2130.936, -4730.043, 50.65128, 2.600541, 120, 0, 0), -- Orgrimmar Grunt (Area: Valley of Honor) (Auras: )
(@CGUID+18, 46647, 1, 1, 2093.14, -4593.85, 49.33633, 5.358161, 120, 0, 0), -- Training Dummy (Area: Valley of Honor) (Auras: 61573 - Banner of the Alliance)
(@CGUID+19, 14539, 1, 1, 2108.84, -4579.1, 49.33633, 6.230825, 120, 0, 0), -- Swift Timber Wolf (Area: Valley of Honor)
(@CGUID+22, 31756, 1, 1, 2066.95, -4604.88, 49.28975, 1.704291, 120, 0, 0), -- Stabled Hunter Pet (Area: Valley of Honor)
(@CGUID+25, 31758, 1, 1, 2066.756, -4611.738, 49.28975, 0.5314288, 120, 0, 0), -- Stabled Hunter Pet (Area: Valley of Honor)
(@CGUID+28, 3296, 1, 1, 2055.37, -4663.19, 32.63573, 5.009095, 120, 0, 0), -- Orgrimmar Grunt (Area: Valley of Honor) (Auras: )
(@CGUID+29, 3358, 1, 1, 2083.222, -4770.205, 28.00946, 1.58825, 120, 0, 0), -- Gorina (Area: Valley of Honor)
(@CGUID+31, 50482, 1, 1, 2087.52, -4769.45, 28.01213, 1.012291, 120, 0, 0), -- Marith Lazuria (Area: Valley of Honor)
(@CGUID+32, 3296, 1, 1, 2024.861, -4657.98, 28.5511, 2.120832, 120, 0, 0), -- Orgrimmar Grunt (Area: Valley of Honor) (Auras: ) old guid 717
(@CGUID+36, 49837, 1, 1, 2032.245, -4656.735, 28.7079, 2.781837, 120, 0, 0), -- Spiny Lizard (Area: Valley of Honor)
(@CGUID+38, 46675, 1, 1, 2088.8, -4767.27, 28.01213, 4.153883, 120, 0, 0), -- Lugrah (Area: Valley of Honor)
(@CGUID+40, 14540, 1, 1, 2100.4, -4569.89, 49.33633, 0.5759587, 120, 0, 0), -- Swift Brown Wolf (Area: Valley of Honor)
(@CGUID+41, 14541, 1, 1, 2102.94, -4571.69, 49.33633, 1.53589, 120, 0, 0), -- Swift Gray Wolf (Area: Valley of Honor)
(@CGUID+43, 31757, 1, 1, 2076.46, -4589, 49.33633, 5.654867, 120, 0, 0), -- Stabled Hunter Pet (Area: Valley of Honor)
(@CGUID+45, 47771, 1, 1, 2081.68, -4588.85, 49.33633, 2.6529, 120, 0, 0), -- Drukma (Area: Valley of Honor)
(@CGUID+46, 356, 1, 1, 2072.99, -4564.18, 49.33633, 1.745329, 120, 0, 0), -- Black Wolf (Area: Valley of Honor)
(@CGUID+47, 4752, 1, 1, 2085.36, -4572.86, 49.33633, 5.393067, 120, 0, 0), -- Kildar (Area: Valley of Honor)
(@CGUID+48, 31768, 1, 1, 2088.397, -4584.163, 65.13868, 3.220361, 120, 0, 0), -- Stabled Hunter Pet (Area: Valley of Honor)
(@CGUID+49, 12351, 1, 1, 2075.17, -4562.83, 49.33633, 2.391101, 120, 0, 0), -- Dire Riding Wolf (Area: Valley of Honor)
(@CGUID+50, 47809, 1, 1, 2086.21, -4578.24, 49.33633, 1.745329, 120, 0, 0), -- Brown Wolf (Area: Valley of Honor)
(@CGUID+51, 42548, 1, 1, 2029.454, -4598.487, 30.89835, 4.963881, 120, 0, 0), -- Muddy Crawfish (Area: Valley of Honor)
(@CGUID+52, 49743, 1, 1, 2064.779, -4561.279, 49.37801, 5.097329, 120, 0, 0), -- Dung Beetle (Area: Valley of Honor)
(@CGUID+54, 31769, 1, 1, 2059.19, -4597.96, 54.53453, 5.794493, 120, 0, 0), -- Stabled Hunter Pet (Area: Valley of Honor)
(@CGUID+55, 47764, 1, 1, 2077.69, -4587.09, 49.33633, 5.88176, 120, 0, 0), -- Murog (Area: Valley of Honor)
(@CGUID+56, 3362, 1, 1, 2088.108, -4568.436, 49.37801, 6.148685, 120, 0, 0), -- Ogunaro Wolfrunner (Area: Valley of Honor)
(@CGUID+57, 47808, 1, 1, 2090.61, -4574.53, 49.33633, 2.844887, 120, 0, 0), -- Black Wolf (Area: Valley of Honor)
(@CGUID+58, 49743, 1, 1, 2208.888, -4620.986, 81.70455, 0.461408, 120, 0, 0), -- Dung Beetle (Area: Valley of Honor)
(@CGUID+59, 12353, 1, 1, 2070.63, -4578.04, 49.33633, 3.787364, 120, 0, 0), -- Timber Riding Wolf (Area: Valley of Honor)
(@CGUID+60, 31755, 1, 1, 2082.43, -4591.11, 49.33633, 3.298672, 120, 0, 0), -- Stabled Hunter Pet (Area: Valley of Honor)
(@CGUID+62, 5195, 1, 1, 2071.26, -4580.62, 49.33633, 3.141593, 120, 0, 0), -- Brown Riding Wolf (Area: Valley of Honor)
(@CGUID+66, 49743, 1, 1, 2281.795, -4625.089, 99.82313, 3.682395, 120, 0, 0), -- Dung Beetle (Area: 0)
(@CGUID+68, 49743, 1, 1, 2318.733, -4716.366, 117.0158, 3.291296, 120, 0, 0), -- Dung Beetle (Area: 0)
(@CGUID+69, 49743, 1, 1, 2261.286, -4623.78, 92.22597, 3.034986, 120, 0, 0), -- Dung Beetle (Area: 0)
(@CGUID+71, 49837, 1, 1, 2313.926, -4647.306, 110.4751, 5.228102, 120, 0, 0), -- Spiny Lizard (Area: 0)
(@CGUID+72, 49837, 1, 1, 2293.419, -4635.905, 104.2426, 1.571773, 120, 0, 0), -- Spiny Lizard (Area: 0)
(@CGUID+73, 3296, 1, 1, 2293.286, -4661.32, 105.5588, 5.522541, 120, 0, 0), -- Orgrimmar Grunt (Area: 0) (Auras: ) old guid 758
(@CGUID+75, 42650, 1, 1, 2321.906, -4738.458, 122.2641, 0.938438, 120, 0, 0), -- Goblin Siegeworker (Area: 0) (Auras: 80126 - Goblin Carrying a Horde Crate)
(@CGUID+76, 42548, 1, 1, 2329.702, -4738.493, 116.8893, 3.171628, 120, 0, 0), -- Muddy Crawfish (Area: 0)
(@CGUID+77, 42650, 1, 1, 2347.325, -4742.363, 121.195, 0.9773844, 120, 0, 0), -- Goblin Siegeworker (Area: 0)
(@CGUID+78, 42548, 1, 1, 2360.02, -4771.724, 119.1137, 1.124648, 120, 0, 0), -- Muddy Crawfish (Area: 0)
(@CGUID+79, 42650, 1, 1, 2375.211, -4760.818, 123.3872, 1.910486, 120, 0, 0), -- Goblin Siegeworker (Area: 0) old guid 764
(@CGUID+80, 42650, 1, 1, 2322.724, -4768.457, 123.5431, 3.996804, 120, 0, 0), -- Goblin Siegeworker (Area: 0) (Auras: 80126 - Goblin Carrying a Horde Crate)  old guid 765
(@CGUID+81, 42650, 1, 1, 2345.14, -4796.854, 124.3948, 4.939282, 120, 0, 0), -- Goblin Siegeworker (Area: 0)  old guid 766
(@CGUID+82, 42671, 1, 1, 2390.698, -4790.512, 126.4508, 0.3141593, 120, 0, 0), -- Chief Engineer (Area: 0)  old guid 767
(@CGUID+83, 42673, 1, 1, 2392.984, -4796.818, 126.877, 0.9250245, 120, 0, 0), -- Hellscream Demolisher (Area: 0)
(@CGUID+84, 42650, 1, 1, 2375.762, -4787.292, 129.7977, 4.694936, 120, 0, 0), -- Goblin Siegeworker (Area: 0)
(@CGUID+85, 42650, 1, 1, 2366.611, -4790.205, 129.7605, 0.2268928, 120, 0, 0), -- Goblin Siegeworker (Area: 0)
(@CGUID+86, 42673, 1, 1, 2402.266, -4807.132, 127.0672, 0.3839724, 120, 0, 0), -- Hellscream Demolisher (Area: 0)
(@CGUID+87, 42650, 1, 1, 2387.059, -4820.118, 134.1067, 5.916666, 120, 0, 0), -- Goblin Siegeworker (Area: 0)
(@CGUID+88, 42650, 1, 1, 2384.826, -4813.146, 129.956, 2.600541, 120, 0, 0), -- Goblin Siegeworker (Area: 0)
(@CGUID+89, 42671, 1, 1, 2407.099, -4808.962, 126.9619, 1.064651, 120, 0, 0), -- Chief Engineer (Area: 0)
(@CGUID+90, 42650, 1, 1, 2399.405, -4814.858, 127.5179, 4.014257, 120, 0, 0), -- Goblin Siegeworker (Area: 0) (Auras: 80126 - Goblin Carrying a Horde Crate) old guid 775
(@CGUID+91, 42650, 1, 1, 2422.088, -4806.223, 127.3449, 2.851961, 120, 0, 0), -- Goblin Siegeworker (Area: 0) old guid 776
(@CGUID+92, 42650, 1, 1, 2398.076, -4818.552, 132.5486, 3.787364, 120, 0, 0), -- Goblin Siegeworker (Area: 0)
(@CGUID+93, 49837, 1, 1, 2427.167, -4788.862, 128.8044, 0.1792479, 120, 0, 0), -- Spiny Lizard (Area: 0)
(@CGUID+94, 42650, 1, 1, 2430.163, -4828.295, 142.047, 4.694936, 120, 0, 0), -- Goblin Siegeworker (Area: 0)
(@CGUID+95, 42650, 1, 1, 2404.344, -4846.243, 136.9398, 5.113815, 120, 0, 0), -- Goblin Siegeworker (Area: 0) old guid 780
(@CGUID+96, 42650, 1, 1, 2393.2, -4828.768, 127.8356, 2.844887, 120, 0, 0), -- Goblin Siegeworker (Area: 0)
(@CGUID+97, 42650, 1, 1, 2438.661, -4858.741, 138.4747, 5.131268, 120, 0, 0), -- Goblin Siegeworker (Area: 0)
(@CGUID+98, 42650, 1, 1, 2440.625, -4867.327, 150.8198, 2.216568, 120, 0, 0), -- Goblin Siegeworker (Area: 0)
(@CGUID+99, 42672, 1, 1, 2482.097, -4815.262, 143.0676, 5.393067, 120, 0, 0), -- Foreman Glibbs (Area: 0)
(@CGUID+100, 42673, 1, 1, 2446.889, -4832.603, 131.6044, 1.012291, 120, 0, 0), -- Hellscream Demolisher (Area: 0)
(@CGUID+101, 42671, 1, 1, 2452.552, -4830.993, 132.6834, 1.064651, 120, 0, 0), -- Chief Engineer (Area: 0)
(@CGUID+102, 42650, 1, 1, 2458.705, -4856.469, 138.3684, 3.374021, 120, 0, 0), -- Goblin Siegeworker (Area: 0) old guid 787
(@CGUID+103, 42650, 1, 1, 2452.25, -4853.809, 137.7998, 3.071779, 120, 0, 0), -- Goblin Siegeworker (Area: 0) (Auras: 80126 - Goblin Carrying a Horde Crate)
(@CGUID+104, 3296, 1, 1, 2450.965, -4825.7, 132.9035, 5.861367, 120, 0, 0), -- Orgrimmar Grunt (Area: 0) (Auras: )  old guid 789
(@CGUID+105, 42650, 1, 1, 2434.986, -4841.952, 132.6866, 2.792527, 120, 0, 0), -- Goblin Siegeworker (Area: 0)
(@CGUID+106, 42650, 1, 1, 2488.392, -4827.316, 142.4043, 1.614059, 120, 0, 0), -- Goblin Siegeworker (Area: 0) (Auras: 80126 - Goblin Carrying a Horde Crate) old guid 791
(@CGUID+107, 42650, 1, 1, 2472.807, -4868.455, 141.0457, 3.543018, 120, 0, 0), -- Goblin Siegeworker (Area: 0)
(@CGUID+108, 3296, 1, 1, 2510.97, -4856.11, 148.5153, 1.361357, 120, 0, 0), -- Orgrimmar Grunt (Area: 0) (Auras: )
(@CGUID+110, 35162, 1, 1, 2482.71, -5031.668, 142.9066, 3.595378, 120, 0, 0), -- Azshara Sapling (Area: Orgrimmar Rear Gate) (Auras: )
(@CGUID+111, 3296, 1, 1, 2561.502, -4849.932, 144.9335, 5.131268, 120, 0, 0), -- Orgrimmar Grunt (Area: Orgrimmar Rear Gate) (Auras: )
(@CGUID+112, 3296, 1, 1, 2549.267, -4868.382, 145.5338, 0.4363323, 120, 0, 0), -- Orgrimmar Grunt (Area: Orgrimmar Rear Gate) (Auras: )
(@CGUID+113, 35162, 1, 1, 2514.72, -5012.401, 133.0677, 5.305801, 120, 0, 0), -- Azshara Sapling (Area: Orgrimmar Rear Gate) (Auras: )
(@CGUID+114, 8576, 1, 1, 2551.691, -4851.772, 145.8126, 5.393067, 120, 0, 0), -- Ag'tor Bloodfist (Area: Orgrimmar Rear Gate)
(@CGUID+115, 35086, 1, 1, 2546.905, -4861.781, 145.8856, 0.6283185, 120, 0, 0), -- Labor Captain Grabbit (Area: Orgrimmar Rear Gate)
(@CGUID+116, 35162, 1, 1, 2639.04, -4721.168, 142.183, 3.176499, 120, 0, 0); -- Azshara Sapling (Area: Orgrimmar Rear Gate)

-- Pathing
SET @NPC := @CGUID+32;
SET @OLDNPC := 717;
SET @PATH := @NPC * 10;
SET @OLDPATH := @OLDNPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2025.857,`position_y`=-4683.201,`position_z`=28.42917 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@OLDNPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
DELETE FROM `waypoint_data` WHERE `id`=@OLDPATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2025.857,-4683.201,28.42917,0,0,0,0,100,0),
(@PATH,2,2015.818,-4688.088,28.73193,0,0,0,0,100,0),
(@PATH,3,2003.643,-4693.797,29.23093,0,0,0,0,100,0),
(@PATH,4,1998.419,-4691.936,29.85946,0,0,0,0,100,0),
(@PATH,5,1994.419,-4690.186,30.85946,0,0,0,0,100,0),
(@PATH,6,1990.419,-4688.186,31.85946,0,0,0,0,100,0),
(@PATH,7,1986.685,-4686.464,32.28598,0,0,0,0,100,0),
(@PATH,8,1985.685,-4685.964,32.28598,0,0,0,0,100,0),
(@PATH,9,1981.435,-4683.964,32.53598,0,0,0,0,100,0),
(@PATH,10,1976.935,-4682.214,32.28598,0,0,0,0,100,0),
(@PATH,11,1971.302,-4679.623,31.55442,0,0,0,0,100,0),
(@PATH,12,1966.365,-4681.003,32.18766,0,0,0,0,100,0),
(@PATH,13,1960.615,-4680.253,32.68766,0,0,0,0,100,0),
(@PATH,14,1953.954,-4679.512,33.14034,0,0,0,0,100,0),
(@PATH,15,1946.454,-4678.262,33.64034,0,0,0,0,100,0),
(@PATH,16,1941.09,-4676.992,33.84451,0,0,0,0,100,0),
(@PATH,17,1927.174,-4666.602,33.64549,0,0,0,0,100,0),
(@PATH,18,1922.214,-4656.237,33.53629,0,0,0,0,100,0),
(@PATH,19,1927.13,-4666.74,33.56191,0,0,0,0,100,0),
(@PATH,20,1927.491,-4666.738,33.64042,0,0,0,0,100,0),
(@PATH,21,1941.121,-4677.292,33.79312,0,0,0,0,100,0),
(@PATH,22,1952.621,-4679.292,33.29312,0,0,0,0,100,0),
(@PATH,23,1953.087,-4679.645,33.25417,0,0,0,0,100,0),
(@PATH,24,1954.087,-4679.895,33.00417,0,0,0,0,100,0),
(@PATH,25,1960.837,-4680.395,32.50417,0,0,0,0,100,0),
(@PATH,26,1966.614,-4681.123,31.85062,0,0,0,0,100,0),
(@PATH,27,1970.864,-4679.373,31.60062,0,0,0,0,100,0),
(@PATH,28,1971.112,-4679.344,31.69574,0,0,0,0,100,0),
(@PATH,29,1972.612,-4678.594,31.69574,0,0,0,0,100,0),
(@PATH,30,1977.362,-4681.344,32.19574,0,0,0,0,100,0),
(@PATH,31,1981.612,-4683.594,32.44574,0,0,0,0,100,0),
(@PATH,32,1985.862,-4685.844,32.44574,0,0,0,0,100,0),
(@PATH,33,1986.063,-4686.081,32.31482,0,0,0,0,100,0),
(@PATH,34,1987.063,-4686.581,32.31482,0,0,0,0,100,0),
(@PATH,35,1990.313,-4688.331,31.81482,0,0,0,0,100,0),
(@PATH,36,1994.313,-4690.081,30.81482,0,0,0,0,100,0),
(@PATH,37,1999.119,-4692.657,29.49647,0,0,0,0,100,0),
(@PATH,38,2003.999,-4693.762,29.15011,0,0,0,0,100,0),
(@PATH,39,2016.105,-4687.969,28.69383,0,0,0,0,100,0),
(@PATH,40,2025.87,-4682.854,28.44343,0,0,0,0,100,0),
(@PATH,41,2027.443,-4670.143,28.80083,0,0,0,0,100,0),
(@PATH,42,2027.256,-4661.537,28.77932,0,0,0,0,100,0),
(@PATH,43,2020.852,-4650.886,28.84587,0,0,0,0,100,0),
(@PATH,44,2020.852,-4650.886,28.34587,0,0,0,0,100,0),
(@PATH,45,2021.602,-4649.136,30.09587,0,0,0,0,100,0),
(@PATH,46,2024.602,-4648.136,31.84587,0,0,0,0,100,0),
(@PATH,47,2024.575,-4648.085,31.76911,0,0,0,0,100,0),
(@PATH,48,2022.575,-4646.835,31.76911,0,0,0,0,100,0),
(@PATH,49,2023.075,-4645.585,31.76911,0,0,0,0,100,0),
(@PATH,50,2023.83,-4640.935,31.93436,0,0,0,0,100,0),
(@PATH,51,2024.012,-4639.788,31.67921,0,0,0,0,100,0),
(@PATH,52,2023.631,-4640.864,31.93753,0,0,0,0,100,0),
(@PATH,53,2022.881,-4644.864,31.93753,0,0,0,0,100,0),
(@PATH,54,2022.803,-4644.882,31.83164,0,0,0,0,100,0),
(@PATH,55,2022.303,-4646.882,31.83164,0,0,0,0,100,0),
(@PATH,56,2019.803,-4646.632,31.83164,0,0,0,0,100,0),
(@PATH,57,2020.303,-4648.382,30.08164,0,0,0,0,100,0),
(@PATH,58,2020.29,-4648.641,30.02628,0,0,0,0,100,0),
(@PATH,59,2020.54,-4651.641,28.77628,0,0,0,0,100,0),
(@PATH,60,2027.098,-4661.933,28.80339,0,0,0,0,100,0),
(@PATH,61,2027.583,-4670.238,28.69053,0,0,0,0,100,0),
(@PATH,62,2025.674,-4683.059,28.40272,0,0,0,0,100,0);

SET @NPC := @CGUID+73;
SET @OLDNPC := 758;
SET @PATH := @NPC * 10;
SET @OLDPATH := @OLDNPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2354.57,`position_y`=-4723.89,`position_z`=120.437 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@OLDNPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
DELETE FROM `waypoint_data` WHERE `id`=@OLDPATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2354.57,-4723.89,120.437,4.031711,5000,0,0,100,0),
(@PATH,2,2344.805,-4730.075,120.1041,0,0,0,0,100,0),
(@PATH,3,2337.805,-4723.825,118.3541,0,0,0,0,100,0),
(@PATH,4,2335.555,-4714.075,116.8541,0,0,0,0,100,0),
(@PATH,5,2319.305,-4678.825,111.3541,0,0,0,0,100,0),
(@PATH,6,2299.555,-4659.825,106.8541,0,0,0,0,100,0),
(@PATH,7,2263.305,-4637.075,96.60415,0,0,0,0,100,0),
(@PATH,8,2225.305,-4628.825,85.60415,0,0,0,0,100,0),
(@PATH,9,2179.04,-4639.76,69.7713,3.769911,5000,0,0,100,0),
(@PATH,10,2188.555,-4642.075,73.10415,0,0,0,0,100,0),
(@PATH,11,2216.555,-4633.575,82.85415,0,0,0,0,100,0),
(@PATH,12,2259.305,-4640.575,95.60415,0,0,0,0,100,0),
(@PATH,13,2289.555,-4657.575,104.8541,0,0,0,0,100,0),
(@PATH,14,2315.805,-4682.575,111.3541,0,0,0,0,100,0),
(@PATH,15,2328.055,-4707.575,115.3541,0,0,0,0,100,0),
(@PATH,16,2332.055,-4720.075,117.6041,0,0,0,0,100,0),
(@PATH,17,2338.555,-4725.075,118.6041,0,0,0,0,100,0),
(@PATH,18,2347.555,-4726.075,120.1041,0,0,0,0,100,0);

SET @NPC := @CGUID+79;
SET @OLDNPC := 764;
SET @PATH := @NPC * 10;
SET @OLDPATH := @OLDNPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2427.715,`position_y`=-4825.382,`position_z`=130.8018 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@OLDNPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '80126');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
DELETE FROM `waypoint_data` WHERE `id`=@OLDPATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2427.715,-4825.382,130.8018,1.204277,5000,0,0,100,0),
(@PATH,2,2429.473,-4822.097,130.7333,0,0,0,0,100,0),
(@PATH,3,2431.723,-4818.597,129.9833,0,0,0,0,100,0),
(@PATH,4,2430.223,-4814.347,129.2333,0,0,0,0,100,0),
(@PATH,5,2426.973,-4810.097,128.4833,0,0,0,0,100,0),
(@PATH,6,2422.473,-4806.347,127.7333,0,0,0,0,100,0),
(@PATH,7,2415.973,-4804.347,127.2333,0,0,0,0,100,0),
(@PATH,8,2411.473,-4803.597,126.9833,0,0,0,0,100,0),
(@PATH,9,2408.723,-4801.347,126.9833,0,0,0,0,100,0),
(@PATH,10,2403.473,-4799.847,126.9833,0,0,0,0,100,0),
(@PATH,11,2399.723,-4801.347,127.2333,0,0,0,0,100,0),
(@PATH,12,2394.473,-4805.847,127.7333,0,0,0,0,100,0),
(@PATH,13,2393.473,-4811.597,127.9833,0,0,0,0,100,0),
(@PATH,14,2392.973,-4812.097,127.9833,0,0,0,0,100,0),
(@PATH,15,2393.473,-4808.347,127.7333,0,0,0,0,100,0),
(@PATH,16,2397.473,-4802.597,127.2333,0,0,0,0,100,0),
(@PATH,17,2402.473,-4800.097,126.9833,0,0,0,0,100,0),
(@PATH,18,2406.973,-4800.597,126.9833,0,0,0,0,100,0),
(@PATH,19,2415.723,-4805.847,127.2333,0,0,0,0,100,0),
(@PATH,20,2421.723,-4807.597,127.7333,0,0,0,0,100,0),
(@PATH,21,2428.723,-4810.847,128.7333,0,0,0,0,100,0),
(@PATH,22,2429.473,-4817.347,129.4833,0,0,0,0,100,0),
(@PATH,23,2429.223,-4821.347,130.7333,0,0,0,0,100,0),
(@PATH,24,2427.715,-4825.382,130.8018,1.204277,0,0,0,100,0);

SET @NPC := @CGUID+80;
SET @OLDNPC := 765;
SET @PATH := @NPC * 10;
SET @OLDPATH := @OLDNPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2322.724,`position_y`=-4768.457,`position_z`=123.5431 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@OLDNPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '80126');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
DELETE FROM `waypoint_data` WHERE `id`=@OLDPATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2322.724,-4768.457,123.5431,3.996804,5000,0,0,100,0),
(@PATH,2,2323.664,-4767.192,123.7763,0,0,0,0,100,0),
(@PATH,3,2324.414,-4761.692,123.7763,0,0,0,0,100,0),
(@PATH,4,2323.414,-4752.942,123.7763,0,0,0,0,100,0),
(@PATH,5,2320.414,-4746.192,123.7763,0,0,0,0,100,0),
(@PATH,6,2322.414,-4741.442,123.0263,0,0,0,0,100,0),
(@PATH,7,2327.164,-4733.942,120.0263,0,0,0,0,100,0),
(@PATH,8,2332.414,-4731.192,119.2763,0,0,0,0,100,0),
(@PATH,9,2340.414,-4729.942,119.7763,0,0,0,0,100,0),
(@PATH,10,2351.414,-4725.942,120.5263,0,0,0,0,100,0),
(@PATH,11,2356.104,-4721.927,120.5095,3.979351,5000,0,0,100,0),
(@PATH,12,2354.664,-4723.692,120.7763,0,0,0,0,100,0),
(@PATH,13,2350.414,-4726.442,120.5263,0,0,0,0,100,0),
(@PATH,14,2345.164,-4731.192,120.2763,0,0,0,0,100,0),
(@PATH,15,2337.664,-4729.692,119.5263,0,0,0,0,100,0),
(@PATH,16,2333.164,-4730.442,119.2763,0,0,0,0,100,0),
(@PATH,17,2328.164,-4732.942,119.5263,0,0,0,0,100,0),
(@PATH,18,2324.914,-4736.192,121.5263,0,0,0,0,100,0),
(@PATH,19,2322.414,-4741.192,123.0263,0,0,0,0,100,0),
(@PATH,20,2321.664,-4747.192,123.7763,0,0,0,0,100,0),
(@PATH,21,2320.914,-4753.942,123.7763,0,0,0,0,100,0),
(@PATH,22,2322.414,-4760.192,123.7763,0,0,0,0,100,0),
(@PATH,23,2323.914,-4764.692,123.7763,0,0,0,0,100,0),
(@PATH,24,2322.724,-4768.457,123.5431,3.996804,5000,0,0,100,0);

SET @NPC := @CGUID+81;
SET @OLDNPC := 766;
SET @PATH := @NPC * 10;
SET @OLDPATH := @OLDNPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2328.901,`position_y`=-4774.885,`position_z`=123.5431 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@OLDNPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '80126');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
DELETE FROM `waypoint_data` WHERE `id`=@OLDPATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2328.901,-4774.885,123.5431,3.420845,0,0,0,100,0),
(@PATH,2,2328.901,-4774.885,123.5431,0.7504916,5000,0,0,100,0),
(@PATH,3,2330.783,-4771.301,123.7794,0,0,0,0,100,0),
(@PATH,4,2330.033,-4764.301,123.7794,0,0,0,0,100,0),
(@PATH,5,2328.783,-4756.551,123.7794,0,0,0,0,100,0),
(@PATH,6,2326.033,-4750.301,123.7794,0,0,0,0,100,0),
(@PATH,7,2324.283,-4746.801,123.7794,0,0,0,0,100,0),
(@PATH,8,2320.783,-4744.051,123.7794,0,0,0,0,100,0),
(@PATH,9,2320.783,-4740.301,123.0294,0,0,0,0,100,0),
(@PATH,10,2325.283,-4734.301,121.5294,0,0,0,0,100,0),
(@PATH,11,2329.533,-4729.551,119.2794,0,0,0,0,100,0),
(@PATH,12,2337.033,-4728.301,119.2794,0,0,0,0,100,0),
(@PATH,13,2345.783,-4729.801,120.2794,0,0,0,0,100,0),
(@PATH,14,2354.783,-4727.051,120.7794,0,0,0,0,100,0),
(@PATH,15,2354.283,-4726.801,120.7794,0,0,0,0,100,0),
(@PATH,16,2343.783,-4728.051,119.7794,0,0,0,0,100,0),
(@PATH,17,2333.783,-4726.301,118.7794,0,0,0,0,100,0),
(@PATH,18,2328.533,-4730.551,119.0294,0,0,0,0,100,0),
(@PATH,19,2324.033,-4737.801,121.5294,0,0,0,0,100,0),
(@PATH,20,2323.033,-4746.801,123.7794,0,0,0,0,100,0),
(@PATH,21,2326.033,-4755.051,123.7794,0,0,0,0,100,0),
(@PATH,22,2329.783,-4764.051,123.7794,0,0,0,0,100,0),
(@PATH,23,2330.283,-4770.801,123.7794,0,0,0,0,100,0),
(@PATH,24,2328.901,-4774.885,123.5431,3.420845,0,0,0,100,0);

SET @NPC := @CGUID+82;
SET @OLDNPC := 767;
SET @PATH := @NPC * 10;
SET @OLDPATH := @OLDNPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2373.553,`position_y`=-4802.581,`position_z`=127.9173 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@OLDNPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '80126');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
DELETE FROM `waypoint_data` WHERE `id`=@OLDPATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2373.553,-4802.581,127.9173,0,0,0,0,100,0),
(@PATH,2,2377.053,-4801.331,127.9173,0,0,0,0,100,0),
(@PATH,3,2382.303,-4798.831,127.6673,0,0,0,0,100,0),
(@PATH,4,2384.053,-4794.581,127.6673,0,0,0,0,100,0),
(@PATH,5,2387.303,-4791.831,127.1673,0,0,0,0,100,0),
(@PATH,6,2388.303,-4787.331,126.1673,0,0,0,0,100,0),
(@PATH,7,2385.303,-4780.831,125.1673,0,0,0,0,100,0),
(@PATH,8,2378.303,-4770.581,124.6673,0,0,0,0,100,0),
(@PATH,9,2376.303,-4763.831,124.1673,0,0,0,0,100,0),
(@PATH,10,2371.803,-4751.081,122.9173,0,0,0,0,100,0),
(@PATH,11,2370.053,-4744.081,122.1673,0,0,0,0,100,0),
(@PATH,12,2365.303,-4738.331,121.6673,0,0,0,0,100,0),
(@PATH,13,2362.946,-4732.276,120.9367,0,0,0,0,100,0),
(@PATH,14,2365.083,-4733.847,120.7839,0.7679449,5000,0,0,100,0),
(@PATH,15,2365.44,-4741.152,121.7646,0,0,0,0,100,0),
(@PATH,16,2367.44,-4749.402,122.7646,0,0,0,0,100,0),
(@PATH,17,2371.19,-4757.152,123.5146,0,0,0,0,100,0),
(@PATH,18,2377.69,-4765.902,124.2646,0,0,0,0,100,0),
(@PATH,19,2383.94,-4776.152,124.7646,0,0,0,0,100,0),
(@PATH,20,2387.44,-4784.402,125.7646,0,0,0,0,100,0),
(@PATH,21,2388.44,-4789.652,126.5146,0,0,0,0,100,0),
(@PATH,22,2384.94,-4797.152,127.5146,0,0,0,0,100,0),
(@PATH,23,2381.69,-4799.652,127.7646,0,0,0,0,100,0),
(@PATH,24,2377.19,-4800.402,127.7646,0,0,0,0,100,0),
(@PATH,25,2373.94,-4802.652,128.0146,0,0,0,0,100,0),
(@PATH,26,2373.553,-4802.581,127.9173,0,0,0,0,100,0);

SET @NPC := @CGUID+90;
SET @OLDNPC := 775;
SET @PATH := @NPC * 10;
SET @OLDPATH := @OLDNPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2402.055,`position_y`=-4813.739,`position_z`=127.5776 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@OLDNPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '80126');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
DELETE FROM `waypoint_data` WHERE `id`=@OLDPATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2402.055,-4813.739,127.5776,0,0,0,0,100,0),
(@PATH,2,2404.305,-4815.739,127.5776,0,0,0,0,100,0),
(@PATH,3,2404.055,-4818.239,127.5776,0,0,0,0,100,0),
(@PATH,4,2401.205,-4819.62,127.6373,3.01942,5000,0,0,100,0),
(@PATH,5,2401.983,-4819.322,127.9547,0,0,0,0,100,0),
(@PATH,6,2403.983,-4817.572,127.9547,0,0,0,0,100,0),
(@PATH,7,2408.983,-4813.072,127.4547,0,0,0,0,100,0),
(@PATH,8,2415.233,-4809.072,127.4547,0,0,0,0,100,0),
(@PATH,9,2425.733,-4812.822,128.7047,0,0,0,0,100,0),
(@PATH,10,2430.983,-4816.322,129.4547,0,0,0,0,100,0),
(@PATH,11,2434.233,-4822.822,130.7047,0,0,0,0,100,0),
(@PATH,12,2399.405,-4814.858,127.5179,4.014257,5000,0,0,100,0),
(@PATH,13,2402.055,-4813.739,127.5776,0,0,0,0,100,0),
(@PATH,14,2404.305,-4815.739,127.5776,0,0,0,0,100,0),
(@PATH,15,2404.055,-4818.239,127.5776,0,0,0,0,100,0),
(@PATH,16,2401.205,-4819.62,127.6373,3.01942,5000,0,0,100,0),
(@PATH,17,2401.983,-4819.322,127.9547,0,0,0,0,100,0),
(@PATH,18,2403.983,-4817.572,127.9547,0,0,0,0,100,0),
(@PATH,19,2408.983,-4813.072,127.4547,0,0,0,0,100,0),
(@PATH,20,2415.233,-4809.072,127.4547,0,0,0,0,100,0),
(@PATH,21,2425.733,-4812.822,128.7047,0,0,0,0,100,0),
(@PATH,22,2430.983,-4816.322,129.4547,0,0,0,0,100,0),
(@PATH,23,2434.233,-4822.822,130.7047,0,0,0,0,100,0),
(@PATH,24,2433.668,-4825.551,130.861,0,0,0,0,100,0),
(@PATH,25,2437.418,-4828.051,131.111,0,0,0,0,100,0),
(@PATH,26,2437.575,-4830.577,130.95,4.29351,5000,0,0,100,0),
(@PATH,27,2437.575,-4830.577,130.95,1.029744,0,0,0,100,0),
(@PATH,28,2439.49,-4826.217,131.2339,0,0,0,0,100,0),
(@PATH,29,2438.24,-4822.717,130.9839,0,0,0,0,100,0),
(@PATH,30,2433.74,-4816.967,129.7339,0,0,0,0,100,0),
(@PATH,31,2426.49,-4811.967,128.7339,0,0,0,0,100,0),
(@PATH,32,2420.49,-4809.717,127.7339,0,0,0,0,100,0),
(@PATH,33,2411.99,-4811.967,127.4839,0,0,0,0,100,0),
(@PATH,34,2405.49,-4812.717,127.7339,0,0,0,0,100,0),
(@PATH,35,2399.405,-4814.858,127.5179,4.014257,5000,0,0,100,0);

SET @NPC := @CGUID+91;
SET @OLDNPC := 776;
SET @PATH := @NPC * 10;
SET @OLDPATH := @OLDNPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2424.445,`position_y`=-4825.149,`position_z`=130.8846 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@OLDNPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '80126');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
DELETE FROM `waypoint_data` WHERE `id`=@OLDPATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2424.445,-4825.149,130.8846,4.380776,5000,0,0,100,0),
(@PATH,2,2424.445,-4825.149,130.8846,1.099557,0,0,0,100,0),
(@PATH,3,2423.513,-4822.246,131.1352,0,0,0,0,100,0),
(@PATH,4,2419.763,-4822.246,131.1352,0,0,0,0,100,0),
(@PATH,5,2417.013,-4822.246,131.1352,0,0,0,0,100,0),
(@PATH,6,2415.082,-4823.842,130.8859,5.358161,5000,0,0,100,0),
(@PATH,7,2414.826,-4823.365,131.3125,0,0,0,0,100,0),
(@PATH,8,2416.326,-4821.615,131.3125,0,0,0,0,100,0),
(@PATH,9,2419.576,-4822.615,131.3125,0,0,0,0,100,0),
(@PATH,10,2422.826,-4824.115,131.3125,0,0,0,0,100,0),
(@PATH,11,2427.326,-4823.865,131.3125,0,0,0,0,100,0),
(@PATH,12,2430.826,-4821.865,130.8125,0,0,0,0,100,0),
(@PATH,13,2436.576,-4820.365,130.8125,0,0,0,0,100,0),
(@PATH,14,2441.826,-4819.615,131.5625,0,0,0,0,100,0),
(@PATH,15,2446.826,-4821.865,132.3125,0,0,0,0,100,0),
(@PATH,16,2458.076,-4828.365,134.3125,0,0,0,0,100,0),
(@PATH,17,2462.326,-4832.865,135.5625,0,0,0,0,100,0),
(@PATH,18,2465.326,-4839.615,137.0625,0,0,0,0,100,0),
(@PATH,19,2464.576,-4846.365,138.5625,0,0,0,0,100,0),
(@PATH,20,2461.326,-4851.865,138.5625,0,0,0,0,100,0),
(@PATH,21,2457.076,-4855.115,138.3125,0,0,0,0,100,0),
(@PATH,22,2452.576,-4857.365,138.0625,0,0,0,0,100,0),
(@PATH,23,2455.097,-4853.229,138.0922,0,0,0,0,100,0),
(@PATH,24,2458.097,-4851.479,138.3422,0,0,0,0,100,0),
(@PATH,25,2462.597,-4847.229,138.3422,0,0,0,0,100,0),
(@PATH,26,2464.597,-4841.979,137.5922,0,0,0,0,100,0),
(@PATH,27,2464.097,-4835.979,136.3422,0,0,0,0,100,0),
(@PATH,28,2459.347,-4828.229,134.5922,0,0,0,0,100,0),
(@PATH,29,2451.097,-4823.479,133.0922,0,0,0,0,100,0),
(@PATH,30,2443.097,-4820.979,131.8422,0,0,0,0,100,0),
(@PATH,31,2435.097,-4820.979,130.8422,0,0,0,0,100,0),
(@PATH,32,2429.097,-4823.229,131.0922,0,0,0,0,100,0),
(@PATH,33,2426.097,-4823.729,131.3422,0,0,0,0,100,0),
(@PATH,34,2424.445,-4825.149,130.8846,4.380776,5000,0,0,100,0),
(@PATH,35,2424.445,-4825.149,130.8846,1.099557,0,0,0,100,0),
(@PATH,36,2423.513,-4822.246,131.1352,0,0,0,0,100,0),
(@PATH,37,2419.763,-4822.246,131.1352,0,0,0,0,100,0),
(@PATH,38,2417.013,-4822.246,131.1352,0,0,0,0,100,0),
(@PATH,39,2415.082,-4823.842,130.8859,5.358161,5000,0,0,100,0),
(@PATH,40,2414.826,-4823.365,131.3125,0,0,0,0,100,0),
(@PATH,41,2416.326,-4821.615,131.3125,0,0,0,0,100,0),
(@PATH,42,2419.576,-4822.615,131.3125,0,0,0,0,100,0),
(@PATH,43,2422.826,-4824.115,131.3125,0,0,0,0,100,0);

SET @NPC := @CGUID+95;
SET @OLDNPC := 780;
SET @PATH := @NPC * 10;
SET @OLDPATH := @OLDNPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2345.849,`position_y`=-4788.236,`position_z`=123.6137 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@OLDNPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '80126');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
DELETE FROM `waypoint_data` WHERE `id`=@OLDPATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2345.849,-4788.236,123.6137,0,0,0,0,100,0),
(@PATH,2,2345.782,-4788.322,123.8437,0,0,0,0,100,0),
(@PATH,3,2345.742,-4792.829,124.0043,0,0,0,0,100,0),
(@PATH,4,2346.992,-4793.579,124.0043,0,0,0,0,100,0),
(@PATH,5,2346.492,-4796.329,124.7543,0,0,0,0,100,0),
(@PATH,6,2345.14,-4796.854,124.3948,4.939282,5000,0,0,100,0),
(@PATH,7,2346.127,-4793.836,123.9689,0,0,0,0,100,0),
(@PATH,8,2346.127,-4789.586,123.9689,0,0,0,0,100,0),
(@PATH,9,2344.127,-4785.586,123.9689,0,0,0,0,100,0),
(@PATH,10,2345.849,-4788.236,123.6137,0,0,0,0,100,0),
(@PATH,11,2345.785,-4788.327,123.8437,0,0,0,0,100,0),
(@PATH,12,2345.742,-4792.84,124.0043,0,0,0,0,100,0),
(@PATH,13,2346.992,-4793.59,124.0043,0,0,0,0,100,0),
(@PATH,14,2346.492,-4796.34,124.7543,0,0,0,0,100,0),
(@PATH,15,2345.14,-4796.854,124.3948,4.939282,5000,0,0,100,0),
(@PATH,16,2346.127,-4793.836,123.9689,0,0,0,0,100,0),
(@PATH,17,2346.127,-4789.586,123.9689,0,0,0,0,100,0),
(@PATH,18,2344.127,-4785.586,123.9689,0,0,0,0,100,0),
(@PATH,19,2345.849,-4788.236,123.6137,0,0,0,0,100,0),
(@PATH,20,2345.785,-4788.326,123.8437,0,0,0,0,100,0),
(@PATH,21,2345.742,-4792.839,124.0043,0,0,0,0,100,0),
(@PATH,22,2346.992,-4793.589,124.0043,0,0,0,0,100,0),
(@PATH,23,2346.492,-4796.339,124.7543,0,0,0,0,100,0),
(@PATH,24,2345.14,-4796.854,124.3948,4.939282,5000,0,0,100,0),
(@PATH,25,2346.127,-4793.836,123.9689,0,0,0,0,100,0),
(@PATH,26,2346.127,-4789.586,123.9689,0,0,0,0,100,0),
(@PATH,27,2344.127,-4785.586,123.9689,0,0,0,0,100,0),
(@PATH,28,2345.849,-4788.236,123.6137,0,0,0,0,100,0);

SET @NPC := @CGUID+102;
SET @OLDNPC := 787;
SET @PATH := @NPC * 10;
SET @OLDPATH := @OLDNPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2447.274,`position_y`=-4856.858,`position_z`=137.7073 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@OLDNPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '80126');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
DELETE FROM `waypoint_data` WHERE `id`=@OLDPATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2447.274,-4856.858,137.7073,1.710423,5000,0,0,100,0),
(@PATH,2,2449.482,-4858.549,138.2745,0,0,0,0,100,0),
(@PATH,3,2455.732,-4856.799,138.5245,0,0,0,0,100,0),
(@PATH,4,2461.982,-4856.799,139.0245,0,0,0,0,100,0),
(@PATH,5,2472.482,-4858.549,140.0245,0,0,0,0,100,0),
(@PATH,6,2477.732,-4863.299,141.0245,0,0,0,0,100,0),
(@PATH,7,2480.982,-4867.299,141.5245,0,0,0,0,100,0),
(@PATH,8,2447.274,-4856.858,137.7073,1.710423,5000,0,0,100,0),
(@PATH,9,2449.482,-4858.549,138.2745,0,0,0,0,100,0),
(@PATH,10,2455.732,-4856.799,138.5245,0,0,0,0,100,0),
(@PATH,11,2461.982,-4856.799,139.0245,0,0,0,0,100,0),
(@PATH,12,2472.482,-4858.549,140.0245,0,0,0,0,100,0),
(@PATH,13,2477.732,-4863.299,141.0245,0,0,0,0,100,0),
(@PATH,14,2480.982,-4867.299,141.5245,0,0,0,0,100,0),
(@PATH,15,2483.232,-4869.799,142.0245,0,0,0,0,100,0),
(@PATH,16,2480.982,-4866.799,141.5245,0,0,0,0,100,0),
(@PATH,17,2477.982,-4863.299,141.0245,0,0,0,0,100,0),
(@PATH,18,2474.232,-4860.799,140.2745,0,0,0,0,100,0),
(@PATH,19,2469.482,-4857.049,139.7745,0,0,0,0,100,0),
(@PATH,20,2461.732,-4855.799,139.0245,0,0,0,0,100,0),
(@PATH,21,2450.232,-4858.549,138.2745,0,0,0,0,100,0),
(@PATH,22,2447.274,-4856.858,137.7073,1.710423,5000,0,0,100,0);

SET @NPC := @CGUID+104;
SET @OLDNPC := 789;
SET @PATH := @NPC * 10;
SET @OLDPATH := @OLDNPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2354.64,`position_y`=-4749.77,`position_z`=122.443 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@OLDNPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
DELETE FROM `waypoint_data` WHERE `id`=@OLDPATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2354.64,-4749.77,122.443,0.9424778,5000,0,0,100,0),
(@PATH,2,2361.065,-4748.025,122.418,0,0,0,0,100,0),
(@PATH,3,2369.315,-4754.025,123.168,0,0,0,0,100,0),
(@PATH,4,2383.565,-4769.275,124.668,0,0,0,0,100,0),
(@PATH,5,2399.065,-4790.025,126.668,0,0,0,0,100,0),
(@PATH,6,2421.065,-4808.775,127.918,0,0,0,0,100,0),
(@PATH,7,2433.315,-4817.525,130.168,0,0,0,0,100,0),
(@PATH,8,2458.815,-4829.025,134.418,0,0,0,0,100,0),
(@PATH,9,2475.315,-4844.025,139.168,0,0,0,0,100,0),
(@PATH,10,2486.99,-4843.78,141.393,6.073746,5000,0,0,100,0),
(@PATH,11,2479.565,-4836.775,139.418,0,0,0,0,100,0),
(@PATH,12,2466.065,-4827.275,136.168,0,0,0,0,100,0),
(@PATH,13,2449.315,-4819.275,132.668,0,0,0,0,100,0),
(@PATH,14,2426.565,-4807.775,128.418,0,0,0,0,100,0),
(@PATH,15,2409.815,-4793.275,126.668,0,0,0,0,100,0),
(@PATH,16,2394.315,-4776.525,125.668,0,0,0,0,100,0),
(@PATH,17,2376.065,-4751.025,122.918,0,0,0,0,100,0);

SET @NPC := @CGUID+106;
SET @OLDNPC := 791;
SET @PATH := @NPC * 10;
SET @OLDPATH := @OLDNPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2490.851,`position_y`=-4816.962,`position_z`=142.9825 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@OLDNPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '80126');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
DELETE FROM `waypoint_data` WHERE `id`=@OLDPATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2490.851,-4816.962,142.9825,1.047198,0,0,0,100,0),
(@PATH,2,2490.851,-4816.962,142.9825,4.223697,5000,0,0,100,0),
(@PATH,3,2490.052,-4818.995,143.2241,0,0,0,0,100,0),
(@PATH,4,2488.552,-4821.995,142.9741,0,0,0,0,100,0),
(@PATH,5,2489.052,-4825.745,142.9741,0,0,0,0,100,0),
(@PATH,6,2488.302,-4829.745,142.2241,0,0,0,0,100,0),
(@PATH,7,2484.552,-4836.495,140.9741,0,0,0,0,100,0),
(@PATH,8,2482.052,-4844.245,140.7241,0,0,0,0,100,0),
(@PATH,9,2478.302,-4847.995,140.2241,0,0,0,0,100,0),
(@PATH,10,2475.052,-4853.995,140.4741,0,0,0,0,100,0),
(@PATH,11,2467.552,-4856.495,139.7241,0,0,0,0,100,0),
(@PATH,12,2464.552,-4860.245,139.4741,0,0,0,0,100,0),
(@PATH,13,2464.253,-4864.528,138.9658,5.742133,5000,0,0,100,0),
(@PATH,14,2463.802,-4863.745,139.2241,0,0,0,0,100,0),
(@PATH,15,2464.552,-4860.745,139.4741,0,0,0,0,100,0),
(@PATH,16,2467.802,-4858.245,139.7241,0,0,0,0,100,0),
(@PATH,17,2475.552,-4854.745,140.4741,0,0,0,0,100,0),
(@PATH,18,2482.052,-4848.245,140.9741,0,0,0,0,100,0),
(@PATH,19,2485.302,-4837.245,140.9741,0,0,0,0,100,0),
(@PATH,20,2488.552,-4828.995,142.4741,0,0,0,0,100,0),
(@PATH,21,2488.302,-4822.995,142.9741,0,0,0,0,100,0),
(@PATH,22,2490.851,-4816.962,142.9825,1.047198,0,0,0,100,0),
(@PATH,23,2490.851,-4816.962,142.9825,4.223697,0,0,0,100,0);