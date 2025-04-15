# spec/services/string_calculator_spec.rb
require 'rails_helper'
require "string_calculator"


RSpec.describe StringCalculator do
  describe '.add' do
    it "returns 0 for an empty string" do
      expect(StringCalculator.add("")).to eq(0)
    end

    it "returns the number itself for a single number" do
      expect(StringCalculator.add("1")).to eq(1)
    end
    
    it "returns the sum for two comma-separated numbers" do
      expect(StringCalculator.add("1,5")).to eq(6)
    end

    it "handles newline as a delimiter" do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it "handles custom delimiters" do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end
    
    it "throws an exception for negative numbers" do
      expect { StringCalculator.add("-1,2,-3") }.to raise_error("negative numbers not allowed: -1, -3")
    end    
  end
end
