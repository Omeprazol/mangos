-- The Thunderspike (10526)

DELETE FROM event_scripts WHERE id=13685;
INSERT INTO event_scripts VALUES
(13685,1,10,21319,900000,0,0,0,0,1315.69,6684.35,-18.6775,1.40375);

-- Gor Grimgut (21319)
UPDATE creature_template SET
AIName='EventAI', 
faction_A=1781,
faction_H=1781
WHERE entry=21319;

DELETE FROM creature_ai_texts WHERE entry IN (-213191,-213192,-213193);
INSERT INTO creature_ai_texts (entry,content_default,type,comment) VALUES
(-213191,'Puny $r cannot lift spear. Gor lift spear!',0,'Gor Grimgut say1'),
(-213192,'Hah! The Thunderspike is mine. Die!',0,'Gor Grimgut say2'),
(-213193,'%s goes into a furious rage.',2,'Gor Grimgut emote');

DELETE FROM creature_ai_scripts WHERE creature_id=21319;
INSERT INTO creature_ai_scripts VALUES
(2131901,21319,4,0,100,0,0,0,0,0,1,-213191,0,0,1,-106,0,0,0,0,0,0,'Gor Grimgut - Say on Aggro'),
(2131902,21319,0,0,100,0,4000,4000,0,0,1,-213192,0,0,0,0,0,0,0,0,0,0,'Gor Grimgut - Say'),
(2131903,21319,2,0,100,1,80,1,8000,16000,11,35491,0,3,1,-213193,0,0,0,0,0,0,'Gor Grimgut - Furious Rage at 80% HP');
