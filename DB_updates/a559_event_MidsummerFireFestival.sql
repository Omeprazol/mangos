-- Totem beacon focus on MFF bunnies
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

/* spawns
-- alliance camps in WPL and Burning Steps
DELETE FROM creature WHERE id IN (25892,25909);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
('9000021','25892','0','1','1','0','0','-8253.2','-2649.27','133.22','0.284419','300','0','0','1','0','0','0'),
('9000022','25909','0','1','1','0','0','951.684','-1477.73','63.423','1.62985','300','0','0','1','0','0','0');

DELETE FROM gameobject WHERE id IN (187929,187921);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('200090','187921','0','1','1','962.293','-1480.73','62.8527','1.43351','0','0','0.65694','0.753943','60','0','1'),
('200091','187929','0','1','1','-8246.02','-2641.63','133.155','3.55866','0','0','0.978336','-0.207026','60','0','1');

DELETE FROM gameobject WHERE guid IN (200092,200093);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('200092','188021','0','1','1','-8257.77','-2650.76','133.394','0.289328','0','0','0.14416','0.989554','25','0','1'),
('200093','188021','0','1','1','953.291','-1482.58','64.0543','1.83013','0','0','0.792603','0.609738','25','0','1');

-- character cleanup
DELETE FROM character_queststatus where quest in 
(11804,11810,11814,11819,11822,11826,11827,11808,11813,11816,11820,11832,11828,11583,
11761,11757,11581,11732,11739,11743,11748,11751,11755,11756,11737,11742,11745,11749); 
*/

