# Tuple - Immutable => Memory Efficient
'''
point = (5, 6)
print(point[0])
print(point[1])
# point[1] = 10
# TypeError: 'tuple' object does not support item assignment
'''

'''
# Write a function to find PE Ration and PB Ration of a company stock
def find_pe_and_pb(price, eps, book_value):
    pe = price / eps
    pb = price / book_value
    return pe, pb


pe_ration, pb_ration = find_pe_and_pb(100, 2, 4)
print(pe_ration)
print(pb_ration)
print(type(find_pe_and_pb(100, 2, 4)))
'''


# Dictionary

contacts = {
    "rachel": 8887771111,
    "monica": 9191919191,
    "joey": 3332229999
}
print(contacts)
print()
print(contacts['joey'])
print()

# print(contacts['shubham'])
# KeyError: 'shubham'

# get() to access values of dictionary without errors
print(contacts.get('sundar'))             # None
print(contacts.get('sundar', 'Not Available'))   # Not Available

# adding items to dictionary
contacts['satya'] = 1233211233
print(contacts)

# dict and Membership operators
print('satya' in contacts)
print('sundar' in contacts)
print('sundar' not in contacts)

# Nested Dictionary
customers = {
    'rachel' : {'customer_id': 2121, 'phone': 1234, 'address': '1 blue street'},
    'joey' : {'customer_id': 2122, 'phone': 1235, 'address': '4 north street'}
}
print(customers['rachel']['customer_id'])
print(customers['joey']['phone'])
print(customers['rachel']['address'])
print()

# Iterative Statements and Dictionary
# for loop and dictionary
for name in contacts:
    print(name, contacts[name])
print()

# items() function
for name, number in contacts.items():
    print(name, number)
print()

print(dir(contacts))
print()

# keys() function
dict_keys = contacts.keys()
print(type(dict_keys))
print(dict_keys)
print()

for key in dict_keys:
    print(key)
print()

for key in dict_keys:
    print(key, contacts[key])
print()

# values() function
dict_values = contacts.values()
print(type(dict_values))
print(dict_values)
print()

for value in dict_values:
    print(value)
print()

# for key,value in dict_keys,dict_values:
#     print(key,value)
# ValueError: too many values to unpack (expected 2)
