module StringCalculator
  def self.add(numbers)
    # Handle empty string case
    return 0 if numbers.empty?

    # If the string starts with a custom delimiter pattern, extract it
    if numbers.start_with?("//")
      delimiter = numbers[2..numbers.index("\n")-1]
      numbers = numbers[numbers.index("\n")+1..]
      numbers = numbers.gsub(delimiter, ",")
    else
      # Default delimiter is a comma and newline
      numbers = numbers.gsub("\n", ",")
    end

    # Split numbers by comma
    numbers_array = numbers.split(",").map(&:to_i)

    # Check for negative numbers
    negatives = numbers_array.select { |num| num < 0 }
    if negatives.any?
      raise "negative numbers not allowed: #{negatives.join(', ')}"
    end

    # Sum the numbers
    numbers_array.sum
  end
end
