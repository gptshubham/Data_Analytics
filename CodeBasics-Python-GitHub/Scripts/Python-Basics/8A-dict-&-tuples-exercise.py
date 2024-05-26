# creating dictionary for my expenses
my_expenses = {
    'Clothes': 1100,
    'Shoes': 1000,
    'Watch': 900,
    'Mobile_Recharge': 699,
    'Petrol': 1980
}

# creating dictionary for my sisters expenses
my_sisters_expenses = {
    'Mobile_Recharge': 799,
    'DTH_recharge': 999,
    'Clothes': 2310,
    'Makeup': 3670,
    'Shoes': 999
}

# calculation of my total expenses
my_total_expenses = 0
for value in my_expenses.values():
    my_total_expenses += value
print(my_total_expenses)
print()

# calculation of total expenses of my sister
my_sisters_total_expenses = 0
for value in my_sisters_expenses.values():
    my_sisters_total_expenses += value
print(my_sisters_total_expenses)
print()

# checking who spent more
spending_more = 'me' if my_total_expenses > my_sisters_total_expenses else 'my sister'
print(spending_more)
print()

# finding item on witch max money was spent by me
max_exp = 0
max_exp_item = ''
for keys in my_expenses.keys():
    if my_expenses[keys] > max_exp:
        max_exp = my_expenses[keys]
        max_exp_item = keys
print(max_exp_item,max_exp)

# finding item on witch max money was spent by my sister
max_exp = 0
max_exp_item = ''
for keys in my_sisters_expenses.keys():
    if my_sisters_expenses[keys] > max_exp:
        max_exp = my_sisters_expenses[keys]
        max_exp_item = keys
print(max_exp_item,max_exp)
