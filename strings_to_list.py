# -*- coding: utf-8 -*-
"""
Created on Fri Feb 17 11:33:39 2017

@author: AmoolyaD
"""
#Question 1: Converting string to list of words
import re
#Importing sys library for halting the program when while condition is false
import sys

def stringtolist(str):
    string = str
    return re.compile('\w+').findall(string)
    
stringtolist("Hi! I am Amoolya")



#Question 2: Converting English word to Pig Latin
def english_to_pig_latin():
    word = input('Type the word here:')
    while word != '.':
        lst = list(word)
        new_lst = lst[1:] + list(lst[0]) + list("ay")
        new_word = ''.join(new_lst)
        print(new_word)
        word = input('Type the word here:')
    sys.exit()        
    


#Question 3: Finding the total size of the grain reward received by the inventor
#Defined a function for calculating the total amount of wheat grain and depth of storing the grain
def chess_inventor_reward():
    area = input('Area (sq-mi):')
    #area = 627.0
    area = round(float(area))
    #A chess board has 64 squares
    area_sqkm = area*2.59
    area_sqm = area_sqkm*1000000
    weight_wheat = 0.00005 #weight in kg
    bulk_density_wheat = 770 #kg/m3
    no_wheat_grains = 0
    for i in range(1, 65):
        no_wheat_grains = 2**(i-1) + no_wheat_grains #Since the number of wheat grains double with each square
        
    from decimal import Decimal

    total_wheat_grains = '%.2E' % Decimal(no_wheat_grains)
    
    print(total_wheat_grains, 'units')
    total_weight = no_wheat_grains*weight_wheat
    total_weight_sc = '%.2E' % Decimal(total_weight)
    depth = total_weight / (area_sqm * bulk_density_wheat)
    depth_miles = (depth / (1000*1.61))
    total_weight_billion_tonnes = round(total_weight/(1000*1000000000))
    print(depth_miles, 'miles')
    print(total_weight_billion_tonnes, 'billion tonnes')
    
    

