Palindromes
===================

An exercise about palindromes in Ruby. This app takes words in a file as input and writes palindromes generated with the chars of each word in other file as output.

Based on instructions that can be found [here](https://gist.github.com/FerPerales/a210e65b729c342db7bf).

Rules for palindromes
---------------------
Ir order to not use brute force, this app needs rules to decide whether the chars of a specific word can be rearranged to create a palindrome word or not. If a given word fits this rules then it can be used to generate palindromes. If not, it can't.

Here are listed the rules this app uses:
* Word has 2 or more chars in length.
* Word repeats at least 2 times every char. (e.g. gaga => gaag, agga)
* In case of odd length, there can be 1 isolated char. (e.g. akako => akoka, kaoak)
* Count for every char repetition is multiple of 2. (e.g. gaga => g = 2, a = 2)

Authors
-------
* Kevin Perez [kevin.perez@crowint.com](mailto:kevin.perez@crowdint.com)