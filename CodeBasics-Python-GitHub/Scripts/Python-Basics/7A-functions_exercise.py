# Program 1
# Write a python function to check if any given number is a prime number and odd number?
'''
def find_odd_prime(n):
    if n > 2:
        for i in range(2, n):
            if n % i == 0:
                print(f"{n} is not a Prime Number!")
                break
        else:
            print(f'{n} is an Odd Prime Number!')
    elif n == 2:
        print(f'{n} is not an Odd Prime Number!')
    else:
        print(f"{n} is not a Prime Number!")


n = int(input('Enter the Number : '))
find_odd_prime(n)
'''

# Program 2
# Write a python function that will take n as input and print the pattern of n rows.
# If the n is even, then print it flipped.

'''
def display_pattern(n):
    if n > 0:
        if n % 2 != 0:
            for i in range(1,n+1):
                print('* ' * i)
        else:
            for i in range(n,0,-1):
                print('* ' * i)


n = int(input('Enter the Number of Rows : '))
display_pattern(n)
'''

# Program 3
# Master Yoda speaks a sentence in a different order.
# Let's say you want to convert a sentence to Yoda’s speech.
# Write a function named master_yoda which will take a string as input
# and return the output after reversing the words of the sentence.
'''
def master_yoda(sentense):
    word = ''
    new_sentense = ''
    for i in range(len(sentense)-1,-1,-1):
        if sentense[i] == " ":
            new_sentense = new_sentense + word + " "
            word = ''
        else:
            word = sentense[i] + word
    new_sentense = new_sentense + " " + word

    return new_sentense


input_sentense = input("Enter a Sentense : ")
output_sentense = master_yoda(input_sentense)
print(output_sentense)
'''


# Program 4
# Write a function pay_bill which will take a list of expenses, percent commission, and a special offer amount

def pay_bill(expenses, percent_commission=0.098, spacial_offer_amount=None):
    # calculation of total expense
    total_expense = 0
    for expense in expenses:
        total_expense += expense

    # calculation of special offer commission
    special_offer_commission = 0
    if spacial_offer_amount:
        if total_expense >= spacial_offer_amount:
            special_offer_commission = 0.012
            print('Special Offer Applied!')

    # calculation of final amount to be paid
    commission = total_expense * (percent_commission + special_offer_commission)
    final_amount = round((total_expense - commission),2)

    return final_amount


exp_list = [200, 450, 700, 500, 100, 50, 389]
bill = pay_bill(exp_list)
print(bill)
print()
bill = pay_bill(exp_list,0.05)
print(bill)
print()
bill = pay_bill(exp_list, spacial_offer_amount=2000)
print(bill)
print()
bill = pay_bill(exp_list, spacial_offer_amount=2500)
print(bill)
print()
bill = pay_bill(exp_list,0.05,2000)
print(bill)
print()
bill = pay_bill(exp_list,0.05,2500)
print(bill)
