#%%
def bonus_calc (p_net_salary : float, p_rating : int):
    '''This function calculates bonus amount based on Salary Amount'''
    if p_rating == 5:
        bonus_amt = p_net_salary * 2
    elif p_rating == 4:
        bonus_amt = p_net_salary * 1.5
    elif p_rating ==  3:
        bonus_amt = p_net_salary * 1
    elif p_rating == 2:
        bonus_amt = p_net_salary * 0.5
    else:
        bonus_amt = 0
    return (bonus_amt/12)

def tax_calc (p_gross_salary : float):
    '''This function calculates tax amount based on Salary Amount'''
    if p_gross_salary <= 100000:
        tax_amt = 0
    elif p_gross_salary >= 100001 and p_gross_salary <= 125000:
        tax_amt = (125000-100001) * (10/100)
    elif p_gross_salary >= 125001 and p_gross_salary <= 150000:
        tax_amt = (150000-125001) * (20/100)
    else:
         tax_amt = (p_gross_salary-150001) * (30/100)
    return (tax_amt)

def net_salary (p_gross_salary : float):
    '''This function calculates net salary based on Salary Amount'''
    net_salary = p_gross_salary - tax_calc(p_gross_salary)
    return (net_salary)


gross_salary = float(input("Enter the Grooss Salary"))
rating = int(input("Enter the Rating 1 - 5"))
tax = tax_calc(gross_salary)
bonus = bonus_calc(net_salary(gross_salary), rating)
print (net_salary(gross_salary))
net = net_salary(gross_salary) + bonus
print (f'Gross Salary: {gross_salary:.2f}')
print (f'Rating: {rating}')
print (f'Tax: {tax:.2f}')
print (f'Bonus: {bonus:.2f}')
print (f'Net Salary: {net:.2f}')
