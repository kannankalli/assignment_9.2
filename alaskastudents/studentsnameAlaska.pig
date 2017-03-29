STUDENT = load '/user/acadgild/pig/students.txt' using PigStorage(',') as 
(name:chararray,colundertaken:chararray,dob:chararray,stream:chararray,grade:float,state:chararray,city:chararray);

STUDENT_FILTER = filter STUDENT by (state == 'alaska');

STUDENT_NAMES = foreach STUDENT_FILTER generate name;

store STUDENT_NAMES into '/user/acadgild/pig/alaskastudents';

