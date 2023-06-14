# Grade-calculating-problem  
---
CSIE25460 /Programming Language and Compilers/  

Practice on programming the same two exercisesin 5 different programming languages:  
Java, Python, R, ML, and Prolog. You may integrate the two programming exercises (A and B in the following) into one program for each programming language.  
=> Programming Exercises: The attached file HW2data.csv has the scores of  
a class: HW1, HW2, HW3, Midterm, and Final.  

A) The overall score of a student is calculated by the following formula:  
Score = HW1 * 0.1 + HW2 * 0.1 + HW3 * 0.1 + Midterm * 0.3 + Final * 0.4  
Write a program in each of the above 5 different programming languagesto calculate the overall scores of all students. Round off the overall scores to 2 decimal digits.  

B) The grade of a student is translated according to the following table:  
Score  |Grade  
0-49   |E  
50-59  |D  
60-62  |-C  
63-66  |C  
67-69  |C+  
70-72  |-B  
73-76  |B  
77-79  |B+  
80-84  |-A  
85-89  |A  
90-100 |A+  

Write a program in the above 5 different programming languages to translate the overall score of each student into a grade.  
Round off the overall scores into integers before looking up the table.  
Note that for Java, Python, and R, it is required to read the grade standards from HW2grade.csv, while for ML and Prolog, it is allowed to give the grade standards in the program.  
# How to compile these programs: 
First of all I'm reminding you that I'm using Ubuntu here so install python3, swiprolog, polyml, java, Rscript on you machine. I'm using ubuntu because its very handy to install and prepare all of those programming language environments. Use some google to prepare environments on your machine. 
1. Python, Java 
Remember grades.py, grades.java should provide you new csv file as a output. 
Compiling command on ubuntu: 
- python3 grades.py 
- javac grades.java after your class file created java grades
2. Rscript, Polyml, Prolog
Remember your output should be appeared on your consol. 
Compiling command on ubuntu: 
- Rscript grades.r 
- poly --use grades.pl
- swipl -s grades.pl
--- 
Those command maybe written differently on different operating systems so do your research. 



