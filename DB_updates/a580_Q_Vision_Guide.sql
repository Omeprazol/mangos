-- Vision Guide (10525)

-- Add trigger (21321) into world
DELETE FROM creature WHERE id=21321;
INSERT INTO creature VALUES
(2132101,21321,530,1,1,0,0,1315.12,6690.02,-18.3257,3.64892,25,0,0,5000,0,0,0);

-- Event ai
UPDATE creature_template SET
AIName='EventAI',
flags_extra=flags_extra|128
WHERE entry=21321;
DELETE FROM creature_ai_scripts WHERE creature_id=21321;
INSERT INTO creature_ai_scripts VALUES
(2132101,21321,10,0,100,1,1,10,1000,1000,15,10525,6,0,0,0,0,0,0,0,0,0,'Vision Guide - Quest Event');
