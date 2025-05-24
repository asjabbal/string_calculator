# string_calculator

## How to use it programmatically?
```ruby
StringCalculator.new.add("") #=> 0
StringCalculator.new.add("1,2") #=> 3
StringCalculator.new.add("1,2, 3, 4") #=> 10
StringCalculator.new.add("//;1\n2,3;4 #5") #=> 15
StringCalculator.new.add("//;1\n2,3;4 #5.5") #=> 20
StringCalculator.new.add("1,2, -3") #=> Negative numbers not allowed: [-3] (StringCalculator::NegativeNumbersNotAllowed)
StringCalculator.new.add("1,2,-3,4, 5, -6,7, -8") #=> Negative numbers not allowed: [-3, -6, -8] (StringCalculator::NegativeNumbersNotAllowed)
StringCalculator.new.add("//[***]\n1***2***3") #=> 6
StringCalculator.new.add("1,2,567, 1000") #=> 1570
StringCalculator.new.add("//;1\n2 ;567, 1011") #=> 570 (ignores number greater than 1000)
```

## How to run the test cases?
It uses **Minitest** for test cases. Make sure to install the [minitest gem](https://rubygems.org/gems/minitest/versions/5.25.5?locale=en) to run the test cases.
### To run all the test cases:
```sh
$ ruby string_calculator_test.rb
```
### To run specific test case:
```sh
$ ruby string_calculator_test.rb --name test_simple_numbers_str
```
