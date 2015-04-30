# distutils: language = c++
# distutils: sources = Rectangle.cpp

# Cython interface file for wrapping the object
#
#

from libcpp.vector cimport vector

# c++ interface to cython
cdef extern from "Rectangle.h" namespace "shapes":
  cdef cppclass Rectangle:
        Rectangle(int, int, int, int) except +
        int x0, y0, x1, y1
        int getLength()
        int getHeight()
        int getArea()
        void move(int, int)
        double sum_vec(vector[double])
        double sum_mat(vector[vector[double]])
        double sum_mat_ref(vector[vector[double]] &)
        vector[vector[double]] ret_mat(vector[vector[double]])

# creating a cython wrapper class
cdef class PyRectangle:
    cdef Rectangle *thisptr      # hold a C++ instance which we're wrapping
    def __cinit__(self, int x0, int y0, int x1, int y1):
        self.thisptr = new Rectangle(x0, y0, x1, y1)
    def __dealloc__(self):
        del self.thisptr
    def getLength(self):
        return self.thisptr.getLength()
    def getHeight(self):
        return self.thisptr.getHeight()
    def getArea(self):
        return self.thisptr.getArea()
    def move(self, dx, dy):
        self.thisptr.move(dx, dy)
    def sum_vec(self, sv):
        return self.thisptr.sum_vec(sv)
    def sum_mat(self, sv):
        return self.thisptr.sum_mat(sv)
    def sum_mat_ref(self, sv):
        return self.thisptr.sum_mat_ref(sv)
    def ret_mat(self, sv):
        return self.thisptr.ret_mat(sv)