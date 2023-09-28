require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should validate name' do
      @category= Category.new(name: "categoryName")
      @product = Product.new(name: nil, price: 200, quantity: "1", category: @category)
      @product.save
      expect(@product.errors.full_messages).to include ("Name can't be blank")
      puts @product.errors.full_messages
    end
    xit 'should validate price' do
      @category= Category.new(name: "categoryName")
      @product = Product.new(name: "testName", price: nil , quantity: "1", category: @category)
      @product.save
      expect(@product.errors.full_messages).to include ("Price must be an integer")
    end
    it 'should validate quantity' do
      @category= Category.new(name: "categoryName")
      @product = Product.new(name: "testName", price: 200, quantity: nil, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include ("Quantity can't be blank")
    end
    it 'should validate category' do
      @category= Category.new(name: "categoryName")
      @product = Product.new(name: "testName", price: 200, quantity: 3, category: nil)
      @product.save
      expect(@product.errors.full_messages).to include ("Category can't be blank")
    end
  end
end
