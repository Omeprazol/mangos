/*Judgement of Light/ Judgement os Wisdom*/
DELETE FROM spell_proc_event WHERE entry IN (20185, 20186);
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES
(20185, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0),
(20186, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0);
