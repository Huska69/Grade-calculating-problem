import pandas 
import numpy 

input = pandas.read_csv("HW2data.csv")
input['Score'] = input['HW1'] * 0.1 + input['HW2'] * 0.1 + input['HW3'] * 0.1 + input['Midterm'] * 0.3 + input['Final'] * 0.4
input['Score'] = round(input['Score'])

conditions = [
    input['Score'] < 50, 
    input['Score'] < 60,
    input['Score'] < 63,
    input['Score'] < 67,
    input['Score'] < 70,
    input['Score'] < 73,
    input['Score'] < 77,
    input['Score'] < 80,
    input['Score'] < 85,
    input['Score'] < 90,
    input['Score'] >= 90
]

Grades = ['E','D','C-','C','C+','B-','B','B+','A-','A','A+']
input['grade'] = numpy.select(conditions, Grades)
input.to_csv('gradesbypy.csv')
