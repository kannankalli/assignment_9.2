STUDENT = load '/user/acadgild/pig/students.txt' using PigStorage(',') as 
(name:chararray,colundertaken:chararray,dob:chararray,stream1:chararray,grade:float,state:chararray,city:chararray);

STUDENT_FILTER_OREGON = filter STUDENT by (state == 'oregon') AND (stream1 == 'BE');

STUDENT_NAMES = foreach STUDENT_FILTER_OREGON generate name;

store STUDENT_NAMES into '/user/acadgild/pig/oregonBE';

