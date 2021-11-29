require_relative 'product'

RSpec.describe Product do
  
  before do
    @product_a = Product.new({id: 1, name: 'Item1', quantity: 3, price: 25})
  end

  context 'getter methods tests:' do
    it 'responds to id' do
      expect(@product_a).to respond_to(:id)
    end
    it 'responds to name' do
      expect(@product_a).to respond_to(:name)
    end
    it 'responds to quantity' do
      expect(@product_a).to respond_to(:quantity)
    end
    it 'responds to price' do
      expect(@product_a).to respond_to(:price)
    end
  end
  
end