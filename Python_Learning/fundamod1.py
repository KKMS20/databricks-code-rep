#Welcome to Python World
from contextlib import nullcontext

print ("Welcome to Python World")

#Use Case-1 for Single & Multiple lines comments
# Students count #Single line comments
students=100
# Trainers count #Single line comments
trainers=2
'''Sum of 
    Studnets &  Trainers'''  # Multiple line comments
total = students + trainers
print("Students Count", students)
print("Trainers Count", trainers)
print ("Total Studnents & Trainers Count",total)

#Use Case-2 Dead Code
#print("Welcome to Inceptez Python Learning") #Dead Code (it will not execute)

#Indent & Comments Examples with error
'''word='Hello'
for index in word:
print (index)'''

#Indent Examples with Fixing Error
word='Hel  lo     '
spacecount=0
for index in word:
    if index.strip() == "":
        spacecount = spacecount + 1
        continue
    else:
        print(index)

print ("Number of spaces in the word:",spacecount)

#String with Quotes Scenarios
print ("String With Quotes")
print ('String With Quotes')
print ('''String
            With 
                Quotes''')
print (""" String
                With 
                    Quotes""")
#print ('This is Irfan's class'')  #Invalid Syntax.  Perhaps you forgot a comma?
print ("This is Irfan's class")  #Works
#print ("Welcome to "Python" Class")  #Invalid Syntax.  Perhaps you forgot a comma?
print ('Welcome to "Python" Class')

#Use Case-1: Playing with Quotes
#print('This is Inceptez's "Python" class for Data Engineers & AI Engineers')  #Invalid Syntax.  Perhaps you forgot a comma?
#print("This is Inceptez's "Python" class for Data Engineers & AI Engineers")  #Invalid Syntax.  Perhaps you forgot a comma?
print('''This is Inceptez's "Python" class for Data Engineers & AI Engineers''') #with single quotes
print("""This is Inceptez's "Python" class for Data Engineers & AI Engineers""") #with single quotes

#Use Case-2 Playing with Quotes
print('''Welcome to Inceptez Technologies!
Python Training: Basics
Enjoy your learning journey.''')  # With single quotes
print("""Welcome to Inceptez Technologies!
Python Training: Basics
Enjoy your learning journey.""") # With double quotes
