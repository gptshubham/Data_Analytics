# Ex.1 : Pattern Program
for col in range(5,0,-1):
    for row in range(1,col+1):
        print(row,end=' ')
    print()

# Ex.2 : Sum of all Even Numbers between 1 and 20
sum = 0
for num in range(21):
    if num % 2 == 0:
        sum += num

print(sum)

# Alternatively using while loop
num = 1
sum = 0
while num <= 20:
    if num % 2 == 0:
        sum += num
    num += 1

print(sum)

# Ex. 3 : Dice Problem
dice_result = [5,6,4,2,5,4,4,5,3,3,2,6,1,2,1,1,6,5]

# counting 6
count = 0
for element in dice_result:
    if element == 6:
        count += 1

print(count)

# counting 1
count = 0
for element in dice_result:
    if element == 1:
        count += 1

print(count)

# counting two consecutive 6s
dice_result = [5,6,4,2,5,4,4,5,3,3,2,6,1,2,1,1,6,5]
last = 0
count = 0
for element in dice_result:
    if element == 6 and last == 6:
        count += 1
        last = 0
    elif element == 6 and last != 6:
        last = 6
    elif element != 6 and last == 6:
        last = 0

print(count)

# Ex. 4 : Push-ups Program
for push_up_count in range(1,51):
    if push_up_count == 50:
        print('Congratulations! You made it')
    else:
        if push_up_count % 10 == 0:
            confirmation = input("Are you Tired [Yes/No] or [Y/N] : ")
            if confirmation.lower() == "yes" or confirmation.lower() == 'y':
                print(f'You did total push-ups : {push_up_count}')
                break
            else:
                print(f'Remaining push-ups : {50 - push_up_count}')
