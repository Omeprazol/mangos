-- Protecting Our Own (10488)

-- Thunderlord Dire Wolf (20748)/21142/32578
UPDATE creature_template SET
AIName='EventAI'
WHERE entry=20748;

DELETE FROM creature_ai_scripts WHERE creature_id=20748;
INSERT INTO creature_ai_scripts VALUES
(2074801,20748,0,0,100,1,4000,4000,8000,8000,11,5781,1,3,0,0,0,0,0,0,0,0,'Thunderlord Dire Wolf - Cast Threatening Growl'),
(2074802,20748,8,0,100,0,32578,-1,0,0,16,21142,32578,6,0,0,0,0,0,0,0,0,'Thunderlord Dire Wolf - Quest Credit');
