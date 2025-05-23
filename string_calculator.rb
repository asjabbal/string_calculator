class StringCalculator
  class NegativeNumbersNotAllowed < StandardError; end

  def add(numbers_str)
    numbers = extract_numbers(numbers_str)

    negative_numbers = check_negative_numbers(numbers)
    raise NegativeNumbersNotAllowed, "Negative numbers not allowed: #{negative_numbers}" if negative_numbers.size > 0

    numbers.sum
  end

  private

  def extract_numbers(numbers_str)
    numbers = numbers_str.scan(/-?\d+/)
    numbers.map{|num| num.to_i}
  end

  def check_negative_numbers(numbers)
    numbers.select{|num| num < 0}
  end
end
