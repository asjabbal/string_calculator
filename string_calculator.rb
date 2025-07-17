class StringCalculator
  class NegativeNumbersNotAllowed < StandardError; end

  def add(numbers_str)
    numbers = extract_numbers(numbers_str)
    numbers = check_cubes(numbers)

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

  def check_cubes(numbers)
    numbers_count = {}
    filtered_numbers = []
    numbers.each do |n|
      numbers_count[n] = numbers_count[n].to_i + 1
      filtered_numbers << n if numbers_count[n] >= 3 && !filtered_numbers.include?(n)
    end

    if filtered_numbers.size == 0
      return numbers
    end
    numbers = numbers - filtered_numbers

    cubes_arr = filtered_numbers.map{|n| n**3}
    numbers = numbers + cubes_arr

    numbers
  end
end
