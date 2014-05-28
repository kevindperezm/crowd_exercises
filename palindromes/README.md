Palindromes
===================

An exercise about palindromes in Ruby. This app takes strings in a file as input and writes palindromes generated with the chars of each string in other file as output.

Based on instructions that can be found [here](https://gist.github.com/FerPerales/a210e65b729c342db7bf).

Rules for palindromes
---------------------
Ir order to not use brute force, this app needs rules to decide whether the chars of a specific string can be rearranged to create a palindrome string or not. If a given string fits this rules then it can be used to generate palindromes. If not, it can't.

Here are listed the rules this app uses:
* String has 2 or more chars in size.
* String repeats at least 2 times every char. (e.g. gaga => gaag, agga)
* Repeat count for every repeated char is multiple of 2. (e.g. gaga => g = 2, a = 2)

There are some exceptions scenarios for these rules:
* In case of odd-size string, there can be 1 and just 1 isolated char. (e.g. akako => akoka, kaoak)
* Because the isolated char isn't repeated in the string, it doesn't count as a repeated char.

Authors
-------
* Kevin Perez [kevin.perez@crowint.com](mailto:kevin.perez@crowdint.com)