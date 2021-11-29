require_relative 'product'

RSpec.describe Product do
  
  before(:all) do
    @product_a = Product.new({id: 1, name: 'Item1', quantity: 3, price: 25})
  end

  context 'getter methods respond_to tests:' do
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

  context 'getter methods value tests:' do
    it 'returns correct attribute values' do
      expect(@product_a.id).to eq 1
      expect(@product_a.name).to eq 'Item1'
      expect(@product_a.quantity).to eq 3
      expect(@product_a.price).to eq 25
    end
  end

  context 'gets list of all products created' do
    it 'returns an array of all products' do 
      expect(Product.all).to eq [@product_a]
    end
  end
end