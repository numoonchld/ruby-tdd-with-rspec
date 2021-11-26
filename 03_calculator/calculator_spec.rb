require_relative 'calculator'

RSpec.describe Calculator do
  context 'adding two numbers' do
    it 'should return the sum of the two numbers' do
      calc_sum = Calculator.sum(2,3)
      expect(calc_sum).to eq(5)
    end
  end
  context 'subtracting one number from another' do
    it 'should return the difference' do
      calc_difference = Calculator.difference(2,3)
      expect(calc_difference).to eq(-1)
    end
  end
  context 'multiplying two numbers' do
    it 'should return the product of the two numbers' do
      calc_product = Calculator.product(2,3)
      expect(calc_product).to eq(6)
    end
  end
  context 'diving one number by another' do
    it 'should return the quotient' do
      calc_quotient = Calculator.quotient(4,2)
      expect(calc_quotient).to eq(2)
    end
  end
  context 'raise one number to the power of another' do
    it 'should return the exponent' do
      calc_exponent = Calculator.exponent(4,2)
      expect(calc_exponent).to eq(16)
    end
  end
end