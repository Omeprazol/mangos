-- Totem beacon focus on MFF bunnies
DELETE FROM spell_script_target WHERE entry = 47129;
INSERT INTO spell_script_target VALUES
(47129,1,26258),
(47129,1,26355);

#####################################################################################################

-- Stamp Out Bonfire (visual dummy of desacrating)
DELETE FROM spell_script_target WHERE entry = 45437;
INSERT INTO spell_script_target VALUES
-- Alliance Bonfire
(45437,0,187943),
(45437,0,187929),
(45437,0,187945),
(45437,0,187946),
(45437,0,187930),
(45437,0,187944),
(45437,0,187914),
(45437,0,187927),
(45437,0,187564),
(45437,0,187916),
(45437,0,187920),
(45437,0,187923),
(45437,0,187924),
(45437,0,187925),
(45437,0,187926),
(45437,0,187928),
(45437,0,187931),
(45437,0,187932),
(45437,0,187934),
(45437,0,187936),
(45437,0,187938),
(45437,0,187940),
(45437,0,187921),
(45437,0,194044),
(45437,0,194045),
(45437,0,194035),
(45437,0,194032),

-- Horde Bonfire
(45437,0,187971),
(45437,0,187973),
(45437,0,187952),
(45437,0,187963),
(45437,0,187950),
(45437,0,187961),
(45437,0,187959),
(45437,0,187957),
(45437,0,187968),
(45437,0,187948),
(45437,0,187953),
(45437,0,187970),
(45437,0,187966),
(45437,0,187975),
(45437,0,187969),
(45437,0,187951),
(45437,0,187956),
(45437,0,187954),
(45437,0,187947),
(45437,0,187972),
(45437,0,187964),
(45437,0,187559),
(45437,0,187965),
(45437,0,194043),
(45437,0,194037),
(45437,0,194046),
(45437,0,194042),
(45437,0,187958),
(45437,0,194034),
(45437,0,194033);

-- Desacrate Fire! quests (for Horde, Eastern Plaguelands)
DELETE FROM gameobject_questrelation WHERE quest IN
(11761,11757,11581,11732,11739,11743,11748,11751,11755,11756,11737,11742,11745,11749);
DELETE FROM gameobject_involvedrelation WHERE quest IN
(11761,11757,11581,11732,11739,11743,11748,11751,11755,11756,11737,11742,11745,11749);

INSERT INTO gameobject_questrelation VALUES
(187944,11761),
(187940,11757),
(187564,11581),
(187914,11732),
(187929,11739),
(187926,11743),
(187931,11748),
(187934,11751),
(187938,11755),
(187921,11756),
(187920,11737),
(187925,11742),
(187928,11745),
(187932,11749);

INSERT INTO gameobject_involvedrelation VALUES
(187944,11761), -- STV
(187940,11757), -- Menethil Harbour
(187564,11581), -- Sentinel Hill
(187914,11732), -- Refuge Point (AH)
(187929,11739), -- Burning Steppes // pure guess of GO entry -- need sniff conflirmation
(187926,11743), -- Darkshire (Duskwood)
(187931,11748), -- Southshore (HF)
(187934,11751), -- Lakeshire (RM)
(187938,11755), -- Aerie Peak (Hinterlands)
(187921,11756), -- Chillwind Camp (WPL) // pure guess of GO entry -- need sniff conflirmation
(187920,11737), -- Blasted Lands
(187925,11742), -- Kharanos (DM)
(187928,11745), -- Goldshire (EF)
(187932,11749); -- Loch Modan
UPDATE quest_template SET RequiredRaces = 690 WHERE entry IN 
(11761,11757,11581,11732,11739,11743,11748,11751,11755,11756,11737,11742,11745,11749);

#####################################################################################################

-- Honor the Flame! quests (for Alliance, Eastern Kindomes)
DELETE FROM creature_questrelation WHERE quest IN
(11804,11810,11814,11819,11822,11826,11827,11808,11813,11816,11820,11832,11828,11583);
DELETE FROM creature_involvedrelation WHERE quest IN
(11804,11810,11814,11819,11822,11826,11827,11808,11813,11816,11820,11832,11828,11583);

INSERT INTO creature_questrelation VALUES
(25887,11804), -- Refuge Point (AH)
(25892,11810), -- Burning Steppes
(25896,11814), -- Darkshire
(25901,11819), -- Southshore
(25904,11822), -- Lakeshire
(25908,11826), -- The Hinterlands
(25909,11827), -- WPL
(25890,11808), -- Blasted Lands
(25895,11813), -- Dun Morogh
(25898,11816), -- Elwynn Forest
(25902,11820), -- Loch Modan
(25915,11832), -- Stranglethorn Vale
(25911,11828), -- Wetlands
(25910,11583); -- Westfall

INSERT INTO creature_involvedrelation VALUES
(25887,11804), -- Refuge Point (AH)
(25892,11810), -- Burning Steppes
(25896,11814), -- Darkshire
(25901,11819), -- Southshore
(25904,11822), -- Lakeshire
(25908,11826), -- The Hinterlands
(25909,11827), -- WPL
(25890,11808), -- Blasted Lands
(25895,11813), -- Dun Morogh
(25898,11816), -- Elwynn Forest
(25902,11820), -- Loch Modan
(25915,11832), -- Stranglethorn Vale
(25911,11828), -- Wetlands
(25910,11583); -- Westfall

UPDATE quest_template SET RequiredRaces = 1101 WHERE entry IN 
(11804,11810,11814,11819,11822,11826,11827,11808,11813,11816,11820,11832,11828,11583);

UPDATE creature_template SET npcflag = npcflag | 3 WHERE entry IN (25909,25892);

-- Honor the Flame! quests (for Horde, Eastern Kindomes)
DELETE FROM creature_questrelation WHERE quest IN
(11840,11842,11844,11848,11850,11853,11584,11837,11857,11860,11862);
DELETE FROM creature_involvedrelation WHERE quest IN
(11840,11842,11844,11848,11850,11853,11584,11837,11857,11860,11862);

INSERT INTO creature_questrelation VALUES
(25923,11840), -- Arathi Highlands
(25925,11842), -- Badlands
(25927,11844), -- Burning Steppes
(25931,11848), -- Eversong Woods
(25933,11850), -- Ghostlands
(25935,11853), -- Hillsbrad Foothills
(25939,11584), -- Silverpine Forest
(25920,11837), -- Stranglethorn Vale
(25941,11857), -- Swamp of Sorrows
(25944,11860), -- The Hinterlands
(25946,11862); -- Tirisfal Glades
INSERT INTO creature_involvedrelation VALUES
(25923,11840), -- Arathi Highlands
(25925,11842), -- Badlands
(25927,11844), -- Burning Steppes
(25931,11848), -- Eversong Woods
(25933,11850), -- Ghostlands
(25935,11853), -- Hillsbrad Foothills
(25939,11584), -- Silverpine Forest
(25920,11837), -- Stranglethorn Vale
(25941,11857), -- Swamp of Sorrows
(25944,11860), -- The Hinterlands
(25946,11862); -- Tirisfal Glades

UPDATE quest_template SET RequiredRaces = 690 WHERE entry IN 
(11840,11842,11844,11848,11850,11853,11584,11837,11857,11860,11862);

UPDATE creature_template SET npcflag = npcflag | 3 WHERE entry IN (25931,25933,25946);

############################################################################################################

-- Desacrate Fire! quests (for Horde, Eastern Kingdoms)
DELETE FROM gameobject_questrelation WHERE quest IN
(11764,11766,11768,11772,11774,11776,11580,11801,11781,11786,11784);
DELETE FROM gameobject_involvedrelation WHERE quest IN
(11764,11766,11768,11772,11774,11776,11580,11801,11781,11786,11784);

INSERT INTO gameobject_questrelation VALUES
(187947,11764), -- Arathi Highlands
(187954,11766), -- Badlands
(187956,11768), -- Burning Steppes
(194037,11772), -- Eversong Woods
(194046,11774), -- Ghostlands
(187964,11776), -- Hillsbrad Foothills
(187559,11580), -- Silverpine Forest
(187951,11801), -- Stranglethorn Vale
(187969,11781), -- Swamp of Sorrows
(187972,11784), -- The Hinterlands
(194043,11786); -- Tirisfal Glades

INSERT INTO gameobject_involvedrelation VALUES
(187947,11764), -- Arathi Highlands
(187954,11766), -- Badlands
(187956,11768), -- Burning Steppes
(194037,11772), -- Eversong Woods
(194046,11774), -- Ghostlands
(187964,11776), -- Hillsbrad Foothills
(187559,11580), -- Silverpine Forest
(187951,11801), -- Stranglethorn Vale
(187969,11781), -- Swamp of Sorrows
(187972,11784), -- The Hinterlands
(194043,11786); -- Tirisfal Glades

UPDATE quest_template SET RequiredRaces = 1101 WHERE entry IN 
(11764,11766,11768,11772,11774,11776,11580,11801,11781,11786,11784);


#############################################################################################################

/*
-- spawns that needs to be sniffed
DELETE FROM creature WHERE id IN (25892,25909,25931,25933,25946);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
('9000021','25892','0','1','1','0','0','-8253.2','-2649.27','133.22','0.284419','300','0','0','1','0','0','0'),
('9000022','25909','0','1','1','0','0','951.684','-1477.73','63.423','1.62985','300','0','0','1','0','0','0'),
('9000023','25931','530','1','1','0','0','9384.06','-6764.37','15.9061','4.52046','300','0','0','1','0','0','0'),
('9000024','25933','530','1','1','0','0','7691.19','-6831.85','78.089','1.57364','300','0','0','1','0','0','0'),
('9000025','25946','0','1','1','0','0','2270.72','390.175','34.6529','0.324528','300','0','0','1','0','0','0');

DELETE FROM gameobject WHERE id IN (187929,187921,194043,194037,194046);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('200090','187921','0','1','1','962.293','-1480.73','62.8527','1.43351','0','0','0.65694','0.753943','60','0','1'),
('200091','187929','0','1','1','-8246.02','-2641.63','133.155','3.55866','0','0','0.978336','-0.207026','60','0','1'),
('200094','194037','530','1','1','9374.44','-6765.66','15.588','4.69717','0','0','0.712466','-0.701707','60','0','1'),
('200095','194043','0','1','1','2271.98','378.875','34.5583','6.0265','0','0','0.127989','-0.991776','60','0','1'),
('200096','194046','530','1','1','7699.7','-6837.28','77.2783','1.30661','0','0','0.607812','0.794081','60','0','1');


DELETE FROM gameobject WHERE guid IN (200092,200093,200097,200098,200099);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('200092','188021','0','1','1','-8257.77','-2650.76','133.394','0.289328','0','0','0.14416','0.989554','25','0','1'),
('200093','188021','0','1','1','953.291','-1482.58','64.0543','1.83013','0','0','0.792603','0.609738','25','0','1'),
('200097','188021','530','1','1','9384.33','-6761.54','16.672','4.68147','0','0','0.717953','-0.696092','25','0','1'),
('200098','188021','530','1','1','7691.02','-6834.69','78.3759','1.49509','0','0','0.679842','0.733359','25','0','1'),
('200099','188021','0','1','1','2266.48','388.578','35.7845','0.23028','0','0','0.114886','0.993379','25','0','1');

DELETE FROM game_event_creature WHERE guid IN (9000021,9000022,9000023,9000024,9000025);
INSERT INTO game_event_creature VALUES
(9000021,1),
(9000022,1),
(9000023,1),
(9000024,1),
(9000025,1);

DELETE FROM game_event_gameobject WHERE guid IN (200090,200091,200092,200093,200094,200095,200096,200097,200098,200099);
INSERT INTO game_event_gameobject VALUES
(200090,1),
(200091,1),
(200092,1),
(200093,1),
(200094,1),
(200095,1),
(200096,1),
(200097,1),
(200098,1),
(200099,1);

-- character cleanup
DELETE FROM character_queststatus WHERE quest IN 
(11804,11810,11814,11819,11822,11826,11827,11808,11813,11816,11820,11832,11828,11583,
11761,11757,11581,11732,11739,11743,11748,11751,11755,11756,11737,11742,11745,11749,
11764,11766,11768,11772,11774,11776,11580,11801,11781,11786,11784
11840,11842,11844,11848,11850,11853,11584,11837,11857,11860,11862); 
*/
