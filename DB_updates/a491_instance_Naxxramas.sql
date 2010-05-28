-- NAXXRAMAS
###################   boss_anubrekhan   ########################################################
-- crypt guard (summon) based on ACID 3.0.4
DELETE FROM creature_ai_scripts WHERE creature_id = 16573;
INSERT INTO creature_ai_scripts VALUES
('1657301','16573','0','0','100','2','0','0','0','0','11','28969','4','32','0','0','0','0','0','0','0','0','Crypt Guard (Normal) - Cast Acid Spit on Aggro'),
('1657302','16573','0','0','100','4','0','0','0','0','11','56098','4','32','0','0','0','0','0','0','0','0','Crypt Guard (Heroic) - Cast Acid Spit on Aggro'),
('1657303','16573','0','0','100','3','4000','6000','4000','7000','11','28969','1','0','0','0','0','0','0','0','0','0','Crypt Guard (Normal) - Cast Acid Spit'),
('1657304','16573','0','0','100','5','4000','6000','4000','7000','11','56098','1','0','0','0','0','0','0','0','0','0','Crypt Guard (Heroic) - Cast Acid Spit'),
('1657305','16573','0','0','100','7','7000','9000','7000','9000','11','40504','1','0','0','0','0','0','0','0','0','0','Crypt Guard - Cast Cleave'),
('1657306','16573','2','0','100','7','30','0','120000','120000','11','8269','0','1','0','0','0','0','0','0','0','0','Crypt Guard - Cast Frenzy at 30% HP'),
('1657307','16573','5','0','100','7','1000','1000','0','0','11','29105','0','1','0','0','0','0','0','0','0','0','Crypt Guard - Summon Corpse Scarabs (5) at player kill'),
('1657308','16573','6','0','100','6','0','0','0','0','11','28864','6','17','0','0','0','0','0','0','0','0','Crypt Guard - Summon Corpse Scarabs (10) at death');

-- Corpse Scarab Force Despaw After Wipe (Anub'Rekhan encounter)
UPDATE creature_template SET AIName='EventAI' WHERE entry=16698;
DELETE FROM creature_ai_scripts WHERE id IN (1669801,1669802);
INSERT INTO creature_ai_scripts VALUES
(1669801,16698,1,0,100,6,30000,30000,30000,30000,41,0,0,0,0,0,0,0,0,0,0,0,'Corpse Scarab - Force Despawn');

###################   boss_faerlina   ##########################################################
/* restored orginal UDB 390 data broken by one of previous commits >.<
DELETE FROM creature WHERE id IN (16506,16505,15953);
INSERT INTO creature VALUES
(127800,15953,533,3,1,15940,0,3353.25,-3620.1,261.08,4.72984,604800,0,0,2231200,85160,0,0),
(106481,16505,533,2,1,0,0,3347.34,-3618.67,260.996,4.52093,3600,0,0,521320,58750,0,0),
(106440,16505,533,2,1,0,0,3359.72,-3620.47,260.996,4.67408,3600,0,0,521320,58750,0,0),
(128064,16506,533,3,1,16603,0,3350.26,-3619.11,261.08,4.67748,3600,0,0,83408,89790,0,0),
(128063,16506,533,3,1,16603,0,3356.71,-3620.05,261.08,4.57276,3600,0,0,83408,89790,0,0),
(128061,16506,533,3,1,16603,0,3362.66,-3620.97,261.08,4.57276,3600,0,0,83408,89790,0,0),
(128062,16506,533,3,1,16603,0,3344.3,-3618.31,261.08,4.69494,3600,0,0,83408,89790,0,0);

DELETE FROM creature_addon where guid in (SELECT guid FROM creature WHERE id IN (16506,16505,15953));
INSERT INTO creature_addon VALUES
(127800,0,0,1,0,0,NULL),
(128061,0,0,1,0,0,NULL),
(128062,0,0,1,0,0,NULL),
(128063,0,0,1,0,0,NULL),
(128064,0,0,1,0,0,NULL); */

-- Naxxramas Worshipper
DELETE FROM creature_ai_scripts WHERE id IN (1650503,1650513,1650612);
INSERT INTO `creature_ai_scripts` VALUES
(1650503,16505,0,0,100,7,0,0,30000,30000,39,20,0,0,0,0,0,0,0,0,0,0,'Naxxramas Follower - call nearby creatures'),
(1650513,16505,0,0,100,7,0,0,30000,30000,39,20,0,0,0,0,0,0,0,0,0,0,'Naxxramas Worshipper - call nearby creatures'),
(1650612,16506,6,0,100,2,0,0,0,0,11,28732,6,17,0,0,0,0,0,0,0,0,'Naxxramas Worshipper - Cast Widow\'s Embrace on Death (normal)');

-- immunities quoted by wowwiki
-- Naxxramas Worshipper (normal) (charm)
UPDATE creature_template SET mechanic_immune_mask = mechanic_immune_mask |1 WHERE entry = 16506;
-- Naxxramas Follower (normal) (charm,polymorph)
UPDATE creature_template SET mechanic_immune_mask = mechanic_immune_mask |1 &~65536 WHERE entry = 16505;

-- Naxxramas Follower (heroic)(charm,polymorph)
UPDATE creature_template SET mechanic_immune_mask = mechanic_immune_mask |1 |65536 WHERE entry = 29273;

-- Naxxramas Worshipper (heroic) 
UPDATE creature_template SET
Spell1 = 54097,
mechanic_immune_mask = mechanic_immune_mask &~1
WHERE entry = 29274;

DELETE FROM script_texts WHERE entry IN (-1999776,-1999775);
INSERT INTO script_texts (`entry`,`content_default`,`type`,`comment`) VALUES
(-1999776,'%s goes into a frenzy!',3,'Grand Widow Faerlina - EMOTE_FRENZY'),
(-1999775,'%s is affected by Widow\'s Embrace!',3,'Grand Widow Faerlina - EMOTE_WIDOWS_EMBRACE');

###################   boss_gluth  ##############################################################

DELETE FROM script_texts WHERE entry IN (-1999781,-1999780,-1999779,-1533119);
INSERT INTO script_texts (`entry`,`content_default`,`type`,`comment`) VALUES
(-1999781, '%s deciamtes all nearby flesh',3,'Gluth - Decimated Players'),
(-1999780, '%s devours all nearby zombies',2,'Gluth - Decimated Zombie'),
(-1999779, '%s becomes enraged',3,'Gluth - Periodic Enrage'),
(-1533119, '%s spots zombie to devour!',2,'Gluth - Spoted Zombie');

UPDATE creature_template SET ScriptName = 'mob_zombie_chow' WHERE entry = 16360;

################### four horsemen encounter #####################################################

-- Horsemen Tap List NPC
UPDATE creature_template SET
faction_A = 21,
faction_H = 21,
unit_flags = 0,
ScriptName = 'npc_horsemen_tap_list'
WHERE entry = 32575;

DELETE FROM creature WHERE id = 32575;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
('9000019','32575','533','1','1','0','0','2523.25','-2954.26','245.552','2.36946','25','5','0','12600','0','0','0');

-- restored gameobject - door spawn that someone deleted :<
-- INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES('65753','181119','533','3','1','2587.96','-3017.17','241.304','3.14159','0','0','1','0','180','0','1');

####################   boss_sapphiron    #########################################################

-- Sapphiron - unable to attack/be attacked while spawed (invisible)
UPDATE creature_template SET
unit_flags = unit_flags | 0x00000002 | 0x00000100 | 0x00000002
WHERE entry IN (29991,15989);

-- Sapphiron Birth
DELETE FROM gameobject WHERE id = 181356;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('507500','181356','533','1','1','3522.39','-5236.78','137.709','4.50295','0','0','0.296306','0.955093','604800','0','1');
UPDATE gameobject_template SET size = 1.5 WHERE entry = 181356;

-- FrostWyrm areatriggers (triggers Intro event reset/start)
DELETE FROM areatrigger_scripts WHERE entry IN (4167, 4120)
INSERT INTO areatrigger_scripts VALUES
(4167, 'at_naxxramas'),
(4120, 'at_naxxramas');

/* clean udb 390 spawn
DELETE FROM creature WHERE id = 15989;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
('133932','15989','533','3','1','16033','0','3522.39','-5236.78','137.709','4.50295','604800','0','0','4183500','0','0','0');
*/

####################   boss_kelthuzad    #########################################################

-- fix mobs' speed (first phase)
UPDATE `creature_template` SET `speed_run` = 0.25,  `speed_walk` = 0.7 WHERE `entry` = 16427;
UPDATE `creature_template` SET `speed_run` = 0.55,  `speed_walk` = 1.5 WHERE `entry` = 16428;
UPDATE `creature_template` SET `speed_run` =0.1,  `speed_walk` = 0.2 WHERE `entry` = 16429;

/*
-- Arachnid Quarter::Worshippers and folowers
DELETE FROM `creature` WHERE `id` IN (16506);
UPDATE creature_template SET `minmana` ='58750', `maxmana` = '58750' WHERE `entry` IN (29273);
*/
