require 'minitest/autorun'
require_relative 'string_calculator'

class StringCalculatorTest < Minitest::Test
  def test_blank_numbers_str
    assert_equal 0, StringCalculator.new.add("")
  end

  def test_simple_numbers_str
    assert_equal 3, StringCalculator.new.add("1,2")
  end

  def test_multiple_numbers_str
    assert_equal 28, StringCalculator.new.add("1,2,3,4,5,6,7")
  end

  def test_different_delimiters_numbers_str
    assert_equal 15, StringCalculator.new.add("//;1\n2,3;4 #5")
  end

  def test_negative_numbers_str
    error = assert_raises(StringCalculator::NegativeNumbersNotAllowed) do
      StringCalculator.new.add("1,2, -3")
    end

    assert_equal "Negative numbers not allowed: [-3]", error.message
  end

  def test_multiple_negative_numbers_str
    error = assert_raises(StringCalculator::NegativeNumbersNotAllowed) do
      StringCalculator.new.add("1,2,-3,4, 5, -6,7, -8")
    end

    assert_equal "Negative numbers not allowed: [-3, -6, -8]", error.message
  end
end
