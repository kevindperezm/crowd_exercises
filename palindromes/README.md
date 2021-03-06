Palindromes
===================

An exercise about palindromes in Ruby. This app takes strings in a file as input and writes palindromes generated with the chars of each string in other file as output.

Based on instructions that can be found [here](https://gist.github.com/FerPerales/a210e65b729c342db7bf).

Rules for palindromes
---------------------
Ir order to not use brute force, this app needs rules to decide whether the chars of a specific string can be rearranged to create a palindrome string or not. If a given string fits this rules then it can be used to generate palindromes. If not, it can't.

Here are listed the rules this app uses:
* String has 1 or more chars in size.
* String repeats at least 2 times every char. (e.g. gaga => gaag, agga)
* Repeat count for every repeated char is multiple of 2. (e.g. gaga => g = 2, a = 2)

There are some exceptions scenarios for these rules:
* In case of odd-size string, there can be 1 and just 1 isolated char. (e.g. akako => akoka, kaoak)
* The isolated char can be one of the repeated chars.

Validators
----------
Rules for validating strings are implemented in the form of independent classes,
called Validators. A new rule or set of rules can be easily added by creating a 
new Validator and modifying the app to use it.

The default Validators implement each of the above rules, taking in count
the above exceptions.

Validators are located in lib/validators.

Strategies
--------
This app ensures the fact that there are many ways to do the same thing, in
this case, to build palindromes from a string's chars. So, the logic of how
to build palindromes is located in classes called Strategies. Implementing a new
algorithm is as easy as writting a new Strategy and modifying the app to use it.

The default Strategy implementation is a simple algorithm that always produces a 
single palindrome for a given palindromic string.

Strategies are located in lib/strategies.

Authors
-------
* Kevin Perez [kevin.perez@crowdint.com](mailto:kevin.perez@crowdint.com)