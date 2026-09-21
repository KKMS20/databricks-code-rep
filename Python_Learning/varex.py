'''  Variables Characterstics
    1=> Dynamic Inference - Based on the values assigned/given as input, automatically identified the data type in run time.
    2=> Dynamically Typed - Variables in Python can change their data type during execution time (int to string).
    3=> Strongly Typed - Python prevents the operations between incompatible types (example: adding string to an integer)without explicit conversion.
'''

#Dynamic Inference
a=20
b=50
c=a+b
print(a); print(b); print(c)
print ("a Data Type =", type(a)); print("b Data Type =", type(b)); print("c Data Type =", type(c))
#Dynamically Typed -1
a=20
a=a*4.99
print(a)
print ("a Data Type =", type(a))
#Dynamically Typed -2
a='Twenty'
b='Fifty'
c=a+b
print(a); print(b); print(c)
print ("a Data Type =", type(a)); print("b Data Type =", type(b)); print("c Data Type =", type(c))
#Strong Typed TypeError: unsupported operand type(s) for +: 'int' and 'str'
'''a=20
b='Fifty'
c=a+b
print(a); print(b); print(c)'''
#Explicitly Converting int to str and do the operation between incompatible data types (int to string)
a=20
b='Fifty'
c=str(a)+b
print(a); print(b); print(c)
print ("a Data Type =", type(a)); print("b Data Type =", type(b)); print("c Data Type =", type(c))
