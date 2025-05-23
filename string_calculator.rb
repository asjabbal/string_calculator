class StringCalculator
  def add(numbers_str)
    numbers = extract_numbers(numbers_str)
    numbers.sum
  end

  private

  def extract_numbers(numbers_str)
    numbers = numbers_str.scan(/-?\d+/)
    numbers.map{|num| num.to_i}
  end
end
