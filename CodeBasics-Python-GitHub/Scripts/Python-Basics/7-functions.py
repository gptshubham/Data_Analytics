# function to count total expenses
expenses_sergey = [30, 45, 70, 90]
expenses_sundar = [40, 23, 10, 85]


def find_total(expenses):
    """
    This function takes expenses list as an input
    and returns a total sum of that list
    :param expenses: list of expenses
    :return: total expense
    """
    total = 0
    for exp in expenses:
        total += exp
    return total


total = find_total(expenses_sergey)
print(f"Sergey's total expense : {total}")
total = find_total(expenses_sundar)
print(f"Sundar's total expense : {total}")

help(find_total)


# function to calculate volume of a cylinder
# volume of cylinder = pie * r**2 * h


def find_cylinder_volume(radius, height=7):       # Default Argument
    pie = 3.14
    volume = pie * (radius**2) * height
    return volume


r = 5
h = 10

print(find_cylinder_volume(r, h))                 # Positional Argument
print(find_cylinder_volume(h, r))
print(find_cylinder_volume(height=h, radius=r))   # Keyword Argument
print(find_cylinder_volume(r))
