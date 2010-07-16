-- The Lodestone (11358/11366)

DELETE FROM event_scripts WHERE id=15939;
INSERT INTO event_scripts (id,delay,command,datalong,datalong2,datalong3,data_flags,dataint,x,y,z,o) VALUES
(15939,2,10,24381,16000,0,0,0,2406.98,-5735.92,273.655,1.2139),
(15939,2,10,24385,16000,0,0,0,2416.41,-5721.26,272.163,4.15838),
(15939,2,10,24385,16000,0,0,0,2421.95,-5723.21,273.149,3.99188),
(15939,2,10,24385,16000,0,0,0,2425.42,-5728.89,274.728,3.60782),
(15939,2,10,24385,16000,0,0,0,2409.15,-5722.04,270.691,4.62413),
(15939,13,8,24381,1,0,0,0,0,0,0,0);

-- Image of Megalith (24381)
UPDATE creature_template SET 
unit_flags=unit_flags|256,
AIName='EventAI' 
WHERE entry=24381;
UPDATE creature_template SET unit_flags=unit_flags|256|33554432
WHERE entry=24385

DELETE FROM creature_ai_texts WHERE entry IN (-243811,-243812,-243813,-243814);
INSERT INTO creature_ai_texts (entry,content_default,type,comment) VALUES
(-243811,'Arise from th earth, my brothers!',0,'Image of Megalith say1'),
(-243812,'Our iron masters have a mission for us!',0,'Image of Megalith say2'),
(-243813,'Follow me into the mountains to carry out the plan of the masters!',0,'Image of Megalith say3'),
(-243814,'We will not fail!',0,'Image of Megalith say4');

DELETE FROM creature_ai_scripts WHERE creature_id=24381;
INSERT INTO creature_ai_scripts VALUES
(2438101,24381,1,0,100,0,1000,1000,0,0,1,-243811,0,0,0,0,0,0,0,0,0,0,'Image of Megalith - Say 1'),
(2438102,24381,1,0,100,0,5000,5000,0,0,1,-243812,0,0,0,0,0,0,0,0,0,0,'Image of Megalith - Say 2'),
(2438103,24381,1,0,100,0,9000,9000,0,0,1,-243813,0,0,0,0,0,0,0,0,0,0,'Image of Megalith - Say 3'),
(2438104,24381,1,0,100,0,13000,13000,0,0,1,-243814,0,0,0,0,0,0,0,0,0,0,'Image of Megalith - Say 4');
