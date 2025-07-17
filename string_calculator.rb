class StringCalculator
  class NegativeNumbersNotAllowed < StandardError; end

  def add(numbers_str)
    numbers = extract_numbers(numbers_str)

    negative_numbers = check_negative_numbers(numbers)
    raise NegativeNumbersNotAllowed, "Negative numbers not allowed: #{negative_numbers}" if negative_numbers.size > 0

    numbers = reject_numbers_gt_1000(numbers)

    numbers_str.include?("***") ? multiply_numbers(numbers) : add_numbers(numbers)
  end

  private

  def add_numbers(numbers)
    numbers.reduce(0, :+)
  end

  def multiply_numbers(numbers)
    numbers.reduce(1, :*)
  end

  def extract_numbers(numbers_str)
    numbers = numbers_str.scan(/-?\d+/)
    numbers.map{|num| num.to_i}
  end

  def check_negative_numbers(numbers)
    numbers.select{|num| num < 0}
  end

  def reject_numbers_gt_1000(numbers)
    numbers.reject{|num| num > 1000}
  end
end
