STUDENT = load '/user/acadgild/pig/students.txt' using PigStorage(',') as 
(name:chararray,colundertaken:chararray,dob:chararray,stream:chararray,grade:float,state:chararray,city:chararray);

STUDENT_FILTER = filter STUDENT by (state == 'alabama') AND (colundertaken == 'goverenment');

STUDENT_GROUP = group STUDENT_FILTER by state;

GOVERNMENT_COLLEGE = foreach STUDENT_GROUP generate COUNT(STUDENT_FILTER);

store GOVERNMENT_COLLEGE into '/user/acadgild/pig/noofcollegesinalabama';


