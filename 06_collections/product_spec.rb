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

  context 'get list of product names' do 
    it 'returns list of product names' do 
      expect(Product.all_product_names).to eq([@product_a.name])
    end
  end

  context 'ability to filter' do 
    it 'returns list of sold out products' do 
      product_b = Product.new({id: 2, name: 'Item2', quantity: 5, price: 15})
      product_c = Product.new({id: 3, name: 'Item3', quantity: 0, price: 30})

      expect(Product.products_to_order).to eq [product_c]

    end
  end
end