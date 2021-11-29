class Product
  attr_reader :id, :name, :quantity, :price
  @@products = []

  def initialize(data={})
    @id = data[:id] || 0
    @name = data[:name] || 'Test Product'
    @quantity = data[:quantity] || 0
    @price = data[:price] || 0
    @@products << self
  end

  def self.all
    @@products
  end

  def self.all_product_names
    # @@products.map { |item| item.name }
    @@products.map(&:name)
  end

  def self.products_to_order
    #select method
    # @@products.select {|product| product.quantity == 0}

    #reject method
    @@products.reject {|product| product.quantity > 0}
  end
end