expenses = [1200, 1300, 1500, 1700]

# total using sum() function
total_expense = sum(expenses)
print(f'Total expense : {total_expense}')

# total using for loop and in operator
total_expense = 0
for expense in expenses:
    total_expense += expense

print(f'Total expense : {total_expense}')

# total using for loop and range()
total_expense = 0
for i in range(len(expenses)):
    expense = expenses[i]
    total_expense += expense

print(f'Total expense : {total_expense}')

# total using for loop and enumerate()
for i, expense in enumerate(expenses):
    print(f'Month {i+1}, Expense: {expense}')
    total_expense += expense

print(f'Total expense : {total_expense}')

# find the first month in which the expense went above 2000 dollars
expenses = [1200, 1900, 2100, 2300]
for i in range(len(expenses)):
    if expenses[i] > 2000:
        print(f'The first month in which expense went above 2000 dollars is month number {i+1}')
        break

# Alternatively using enumerate()
for i, expense in enumerate(expenses):
    if expense > 2000:
        print(f'The first month in which expense went above 2000 dollars is month number {i + 1}')
        break

# Car Key Example
locations = ['sofa', 'garage', 'chair', 'table', 'closet']
key_location = 'chair'
for location in locations:
    if location == key_location:
        print(f'The Location of Key is {key_location}')
        break

# Odd Numbers between 1 and 10
print('The Odd Numbers between 1 and 10 are :')
for i in range(1, 10):
    if i % 2 != 0:
        print(i, end=' ')
print()
# Alternatively using continue
print('The Odd Numbers between 1 and 10 are :')
for i in range(1, 10):
    if i % 2 == 0:
        continue
    print(i, end=' ')
print()
# While Loop

# sum up all the natural numbers between 1 and 10
n = 1
sum_total = 0
while n <= 10:
    sum_total += n
    n += 1

print(sum_total)
