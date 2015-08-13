# Python c++ interface example

This code illustrates how simple it is to pass n-dimensional (or in this case 2D) numpy arrays from python to c++ vectors and back.

Allowing computationally expensive code to be easily written in c++ and linked to high level python code.

This code is a small adaption from the Cython standard example ([Wrapping c++](http://docs.cython.org/src/userguide/wrapping_CPlusPlus.html)) to also include the 2D numpy example

Rectangle.cpp and Rectangle.h is a an example c++ class to be wrapped

This is wrapped using cython with an interface file rect.pyx and compiled using setup.py in the standard cython way using the command:

Compiling the code:

```bash
python setup.py build_ext --inplace
```

Running the code:

```bash
python python_test.py
```
