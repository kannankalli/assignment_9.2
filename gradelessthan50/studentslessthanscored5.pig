STUDENT = load '/user/acadgild/pig/students.txt' using PigStorage(',') as 
(name:chararray,colundertaken:chararray,dob:chararray,stream:chararray,grade:float,state:chararray,city:chararray);

RANKED = rank STUDENT;

NO_HEADER = filter RANKED by rank_STUDENT > 1 ;

STUDENT_1 = foreach NO_HEADER generate name,grade;

STUDENT_FILTER = filter STUDENT_1 by 5 > grade;

STUDENT_RANKED = rank STUDENT_FILTER;
STUDENT_ORDER = order STUDENT_RANKED by rank_STUDENT_FILTER DESC;
STUDENT_COUNT = limit STUDENT_ORDER  1 ;
store STUDENT_COUNT into '/home/acadgild/Downloads/gradelessthan50';

