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
end
