#!/usr/bin/env python

'''
One-line file description

Detailed Description

Notes on writing readable Python code, from Google Python Style Guide (http://google.github.io/styleguide/pyguide.html)
    - ** p37 Naming: **
        - Examples: module_name , package_name , ClassName , method_name , ExceptionName , function_name GLOBAL_CONSTANT_NAME , global_var_name , instance_var_name , function_parameter_name , local_var_name
        - p38 Examples: package_name module_name ClassName ExceptionError function_name GLOBAL_CONSTANT global_variable instance_variable method_name() method_parameter local_variable
        - Function names, variable names, and filenames should be descriptive;
        avoid single character names, dashes, __double_leading_and_trailing_underscore__ names (reserved by Python)
        - Prepend variables with single underscore if it should be protected (local). _protected_class_variable
        - place related classes and top-level functions together in a module
        - Use CapWords for class names, but lower_with_under.py for module names
    - Whitespace
        - *** p26 two blank lines between top-level definitions (functions or classes). One blank line between method definitions and between the class line and the first method. No blank line following the def line
        - no whitespace inside parentheses, brackets or braces
        - no whitespace before comma, semicolon, or colon
        - use whitespace after comma, semicolon, or colon
        - No whitespace between the open ( or { or [ that starts an argument list
        - surround binary operators & booleans with single space on either side of assignment
            - = == < > etc.
        - Optional to surround arithmetic operators
    - p28 Docstrings
        - Use three double-quotes """
        - One summary line terminated by a period, question mark, or exclamation point, followed by a blank line, followed by the rest of the docstring starting at the same cursor position as the first quote of the first line
        - All functions should have a docstring unless it meets all of the following criteria: not externally visible, very short, obvious
        - Descriptive """Fetches rows from a Bigtable.""" rather than imperative """Fetch rows from a Bigtable"""
        - Describe calling syntax and semantics, not implementation
        - For overwriting (and only slightly modifying) a method inherited from its parent, can just have a note like """See base class."""
        - List each parameter by name, followed by a description

- Blank space preceeding...
        - section = 3 with ##### 1. Section name #####
        - subsection = 2 with ## 1.1 Subsection name ##
        - function = 2 (followed by docstring)
        - code block = 1


Maintained by: First Last, last modified YYYY/MM/DD

'''



##### 1. Set up Python workspace #####


## 1.1 Import standard packages ##
import time, sys
import numpy as np


## 1.2 Import 3rd Party libraries ##
# import math


## 1.3 Import custom packages ##
# import roboticSkin



##### 2. Initialize Variables #####

variable = 1



##### 3. Functions #####
def fetch_bigtable_rows(big_table, keys, other_silly_variable=None):
    """Fetches rows from a Bigtable.
    
    Retrieves rows pertaining to the given keys from the Table instance
    represented by big_table. Silly things may happen if
    other_silly_variable is not None.
    
    Args:
        big_table: An open Bigtable Table instance.
        keys: A sequence of strings representing the key of each table row
            to fetch.
        other_silly_variable: Another optional variable, that has a much
            longer name than the other args, and which does nothing.
    
    Returns:
        A dict mapping keys to the corresponding table row data
        fetched. Each row is represented as a tuple of strings. For
        example:
        
        {'Serak': ('Rigel VII', 'Preparer'),
         'Zim': ('Irk', 'Invader'),
         'Lrrr': ('Omicron Persei 8', 'Emperor')}
        
        If a key from the keys argument is missing from the dictionary,
        then that row was not found in the table.
    Raises:
        IOError: An error occurred accessing the bigtable.Table object.

    Example:
        dictionary = fetch_bigtable_rows(big_table, keys)
    """
    pass



##### 4. Main loop (goes forever) #####
def main():
    while 1: 
        # Update screen
        print('Looping forever')
        time.sleep(1)



##### 5. Process arguments if called from command line #####
if __name__ == '__main__':
    main()