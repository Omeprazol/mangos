ALTER TABLE db_version CHANGE COLUMN required_10036_01_mangos_spell_proc_event required_10044_01_mangos_spell_chain bit;

DELETE FROM  `spell_chain` WHERE `spell_id` IN (
 62908, 62905, 50371, 50365, 63506, 63505, 63504,
 31785, 33776, 53427, 53429, 53430, 63351, 63350,
 63349, 63411, 63410, 63372, 63370, 63374, 63373,
 63123, 63121, 63117, 63158, 63156, 62762, 62758,
 62765, 62764, 62760, 62759, 63650, 63649, 63648,
 63647, 63646, 63627, 63626, 63625, 48985, 49488,
 49489, 49015, 50154, 55136, 63737, 63733, 63730,
 63543, 63542, 50880, 50884, 50885, 50886, 50887,
 49175, 50031, 51456, 63534, 64129, 64127, 64357,
 64353, 49013, 55236, 55237, 50384, 50385, 50391,
 50392, 49224, 49610, 49611, 47535, 47536, 47537,
 49188, 53530, 53527, 31245, 31244, 55667, 55666,
 32385, 32387, 32392, 32393, 32394, 51528, 51529,
 51530, 51531, 51532, 47569, 47570, 65661, 66191,
 66192, 20335, 20336, 20337, 56636, 56637, 56638,
 34506, 34507, 34508, 34838, 34839, 53290, 53291,
 53292, 46913, 46914, 46915, 19184, 19387, 19388,
 35100, 35102, 51521, 51522, 48539, 48544, 48545,
 53380, 53381, 53382, 53486, 53488, 56822, 59057,
 53709, 53710, 53711, 30881, 30883, 30884, 30885,
 30886
);
