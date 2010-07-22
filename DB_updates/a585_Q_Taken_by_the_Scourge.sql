-- Support for quest Taken by the Scourge (11611)

-- Nerub'ar Victim

UPDATE creature_template SET AIName='EventAI' WHERE entry=25284;
DELETE FROM creature_ai_scripts WHERE creature_id=25284;
INSERT INTO creature_ai_scripts VALUES
(2528401,25284,4,0,100,0,0,0,0,0,21,0,0,0,20,0,0,0,0,0,0,0,'Nerub\'ar Victim - No movement and attack'),
(2528402,25284,6,0,100,0,0,0,0,0,11,45532,0,3,33,25270,6,0,0,0,0,0,'Nerub\'ar Victim - Summon Warsong Peon and Quest Credit on Death');

-- Warsong Peon (25270)

UPDATE creature_template SET
minhealth=5715,
maxhealth=6326,
minlevel=64,
maxlevel=67,
AIName='EventAI'
WHERE entry=25270;

DELETE FROM creature_ai_texts WHERE entry=-25270;
INSERT INTO creature_ai_texts (entry,content_default,type,comment) VALUES
(-25270,'Why it keep telling me to put da lotion in da basket? Me no like da lotion!',0,'Warsong Peon say1');

DELETE FROM creature_ai_scripts WHERE creature_id=25270;
INSERT INTO creature_ai_scripts VALUES
(2527001,25270,11,0,100,0,0,0,0,0,11,43014,0,1,1,-25270,0,0,0,0,0,0,'Warsong Peon - Cast Despawn Self and say');
