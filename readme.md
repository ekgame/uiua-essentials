# Uiua Essentials

Closest thing to a Uiua standard library. The idea is to avoid solving puzzles to do menial things like trimming/padding strings, checking if a string ends with another string, etc. Anything you might expect to find in a standard library for a traditional programming language should (eventually) be here. 

Currently the focus is on string manipulation, but it may expand to include other utilities in the future. Most functions that take strings as inputs also work with arrays.

## Features

- Some helpful constants, like `Alphabet`, `Digits`, `Whitespace`, etc.
- Functions for trimming/padding strings
- Functions to check if array contains/starts/ends with another array
- Functions to split/join an array by delimiter
- Functions to convert string formatting (camelCase, snake_case, etc.)
- Functions to replace/insert sub-arrays into other arrays
- Functions to parse CSV by arbitrary or auto-detected delimiter

All of the functions are documented in the source code. See the `test.ua` file for examples of how to use them.

## Usage

```uiua
# Import functions as required
~ "git: github.com/ekgame/uiua-essentials" ~ Trim

# Use them in your code
Trim "  hello world  "
```