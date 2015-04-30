# Python running example

from __future__ import print_function

import numpy as np
from rect import PyRectangle

# Initialising the wrapped c++ function
R1 = PyRectangle(0, 0, 9, 9);

#Test1: Doing the area example calculation
print("Test 1, Area: ", R1.getArea())

#Test2: Passing a list from python to c++
list1 = [1,2,3,4,5]
print("Test 2, Sum list: ", R1.sum_vec(list1))

#Test3: Passing a numpy array from python to c++
list2 = np.array([1,2,3,4,5])
print(" Test 3, Sum list: ", R1.sum_vec(list2))

#Test4: Passing a 2D list from python to c++
list3 = [[1, 2, 3], [4, 5, 6]]
print("Test 4, Sum list: ", R1.sum_mat(list3))

#Test5: Passing a 2D numpy array from python to c++
# Passing by value makes a second copy so best to pass by reference as demonstrated in the next example
list4 = np.array([[1, 2, 3], [4, 5, 6]])
print("Test 5, Sum list: ", R1.sum_mat(list4))

#Test6: Passing a 2D numpy array from python to c++ as a constant reference
list5 = np.array([[1, 2, 3], [4, 5, 6]])
print("Test 6, Sum list: ", R1.sum_mat_ref(list5))

#Test7: Returning a 2D numpy array from c++
list6 = np.array([[1, 2, 3], [4, 5, 6]])
print("Test 7, Sum list: ", R1.ret_mat(list6))

# This should work with any n-dimensional array