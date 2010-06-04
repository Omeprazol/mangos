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

-- Sapphiron - unable to attack/be attacked while spawned (invisible), also immune to taunt
UPDATE creature_template SET
unit_flags = unit_flags |0x02000000,
flags_extra = flags_extra | 256
WHERE entry IN (29991,15989);

-- Sapphiron Birth
DELETE FROM gameobject WHERE id = 181356;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('507500','181356','533','3','1','3522.39','-5236.78','137.709','4.50295','0','0','0.296306','0.955093','604800','0','1');
UPDATE gameobject_template SET size = 1.5 WHERE entry = 181356;

-- FrostWyrm areatriggers (triggers Intro event reset/start)
DELETE FROM areatrigger_scripts WHERE entry IN (4167);
INSERT INTO areatrigger_scripts VALUES
(4167, 'at_naxxramas');

-- Wing Buffet - unable to attack/be attacked while spawed (invisible)
UPDATE creature_template SET 
faction_A = 21,
faction_H = 21,
unit_flags = unit_flags|0x02000000,
AIName = 'EventAI',
ScriptName = ''
WHERE entry IN (17025);

DELETE FROM creature_ai_scripts WHERE creature_id = 17025;
INSERT INTO creature_ai_scripts VALUES
(1702501,17025,1,0,100,7, 0,0,2000,2000, 11,29328,0,1, 0,0,0,0, 0,0,0,0, 'Sapphirons Wing Buffet - spell Wing Buffet'); 

-- Activate/Deactivate Blizzard
DELETE FROM spell_script_target WHERE entry IN (29969,29970);
INSERT INTO spell_script_target VALUES
(29969,1,16474),
(29970,1,16474);

-- Blizzard NPC
UPDATE creature_template SET
faction_A = 21,
faction_H = 21,
unit_flags = unit_flags |0x02000000,
AIName = '',
ScriptName = '',
flags_extra = flags_extra | 128
WHERE entry IN (16474,30000);

DELETE FROM creature_ai_scripts WHERE creature_id = 16474;

DELETE FROM creature WHERE id = 16474;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
('9000020','16474','533','3','1','0','0','3491.37','-5259.26','138.084','5.48815','25','5','0','300','0','0','2');

DELETE FROM creature_movement WHERE id = 9000020;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
('9000020','1','3491.37','-5259.26','138.084','0','0','0','0','0','0','0','0','0','0','5.48815','0','0'),
('9000020','2','3496.43','-5264.1','138.108','0','0','0','0','0','0','0','0','0','0','5.51957','0','0'),
('9000020','3','3505.91','-5271.13','138.108','0','0','0','0','0','0','0','0','0','0','5.9319','0','0'),
('9000020','4','3519.74','-5273.55','138.107','0','0','0','0','0','0','0','0','0','0','6.24213','0','0'),
('9000020','5','3532.06','-5271.42','138.107','0','0','0','0','0','0','0','0','0','0','0.225976','0','0'),
('9000020','6','3525.07','-5272.68','138.108','0','0','0','0','0','0','0','0','0','0','3.50109','0','0'),
('9000020','7','3514.5','-5273.72','138.108','0','0','0','0','0','0','0','0','0','0','2.99843','0','0'),
('9000020','8','3521.16','-5273.16','138.108','0','0','0','0','0','0','0','0','0','0','0.002137','0','0'),
('9000020','9','3534.69','-5270.81','138.108','0','0','0','0','0','0','0','0','0','0','0.371274','0','0'),
('9000020','10','3545.63','-5264.35','138.045','0','0','0','0','0','0','0','0','0','0','0.720777','0','0'),
('9000020','11','3553.71','-5254.58','138.043','0','0','0','0','0','0','0','0','0','0','1.11348','0','0'),
('9000020','12','3556.94','-5245.73','138.047','0','0','0','0','0','0','0','0','0','0','1.33339','0','0'),
('9000020','13','3557.91','-5233.24','138.043','0','0','0','0','0','0','0','0','0','0','1.78106','0','0'),
('9000020','14','3557.09','-5234.72','138.058','0','0','0','0','0','0','0','0','0','0','4.83626','0','0'),
('9000020','15','3557.18','-5246.17','138.043','0','0','0','0','0','0','0','0','0','0','4.52603','0','0'),
('9000020','16','3556.75','-5237.94','138.064','0','0','0','0','0','0','0','0','0','0','1.55723','0','0'),
('9000020','17','3555.04','-5224.18','138.052','0','0','0','0','0','0','0','0','0','0','1.95778','0','0'),
('9000020','18','3549.38','-5214.19','138.076','0','0','0','0','0','0','0','0','0','0','2.27587','0','0'),
('9000020','19','3538.81','-5207.05','138.107','0','0','0','0','0','0','0','0','0','0','2.5806','0','0'),
('9000020','20','3529.33','-5202.64','138.107','0','0','0','0','0','0','0','0','0','0','2.70627','0','0'),
('9000020','21','3539.63','-5208.08','138.107','0','0','0','0','0','0','0','0','0','0','5.87535','0','0'),
('9000020','22','3528.14','-5202.36','138.107','0','0','0','0','0','0','0','0','0','0','2.74161','0','0'),
('9000020','23','3514.84','-5201.99','138.107','0','0','0','0','0','0','0','0','0','0','3.29531','0','0'),
('9000020','24','3503.27','-5206','138.083','0','0','0','0','0','0','0','0','0','0','3.49559','0','0'),
('9000020','25','3493.69','-5213.55','138.053','0','0','0','0','0','0','0','0','0','0','3.94719','0','0'),
('9000020','26','3485.85','-5225.8','138.037','0','0','0','0','0','0','0','0','0','0','4.30847','0','0'),
('9000020','27','3489.81','-5217.42','138.045','0','0','0','0','0','0','0','0','0','0','1.13939','0','0'),
('9000020','28','3496.69','-5209.48','138.04','0','0','0','0','0','0','0','0','0','0','0.856644','0','0'),
('9000020','29','3489.3','-5219.1','138.049','0','0','0','0','0','0','0','0','0','0','4.19066','0','0'),
('9000020','30','3485.64','-5231.87','138.062','0','0','0','0','0','0','0','0','0','0','4.66975','0','0'),
('9000020','31','3484.28','-5246.34','138.026','0','0','0','0','0','0','0','0','0','0','4.84254','0','0'),
('9000020','32','3491.51','-5259.66','138.088','0','0','0','0','0','0','0','0','0','0','5.23523','0','0'),
('9000020','33','3485.66','-5249.86','138.024','0','0','0','0','0','0','0','0','0','0','1.90514','0','0'),
('9000020','34','3492.75','-5259.76','138.11','0','0','0','0','0','0','0','0','0','0','5.33341','0','0');

/* UDB 390 spawn
DELETE FROM creature WHERE id = 15989;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
('133932','15989','533','3','1','16033','0','3522.39','-5236.78','137.709','4.50295','604800','0','0','4183500','0','0','0');*/

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

####################   boss_grobbulus    #########################################################

-- script names
UPDATE `creature_template` SET `ScriptName` = 'npc_grobbulus_poison_cloud' WHERE `entry` = 16363;
UPDATE `creature_template` SET `ScriptName` = 'boss_grobbulus' WHERE `entry` = 15931;
