class Calculator
  def self.sum(num_a, num_b)
    num_a + num_b
  end
  def self.difference(num_a, num_b)
    num_a - num_b
  end
  def self.product(num_a, num_b)
    num_a * num_b
  end
  def self.quotient(num_a, num_b)
    num_a.to_f / num_b
  end
  def self.exponent(num_a, num_b)
    num_a ** num_b
  end
end