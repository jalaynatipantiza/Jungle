require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should save when all four fields are set' do
      @category = Category.new
      @product = Product.new(
        name:  'Women\'s Zebra pants',
        price: 124.99,
        quantity: 1,
        category: @category
      )
     expect(@product.save).to be true
    end
    it 'should error when name is empty' do
      @category = Category.new
      @product = Product.new(
        name: nil,
        price: 124.99,
        quantity: 12,
        category: @category
      )
      @product.save
      expect(@product.errors.full_messages).to eq(["Name can't be blank"])
    end
    it 'should error when price is empty' do
      @category = Category.new
      @product = Product.new(
        name: 'Women\'s Zebra pants' ,
        price: nil,
        quantity: 12,
        category: @category
      )
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it 'should error when quantity is empty' do
      @category = Category.new
      @product = Product.new(
        name: 'Women\'s Zebra pants' ,
        price: '124',
        quantity: nil,
        category: @category
      )
      @product.save
      expect(@product.errors.full_messages).to eq(["Quantity can't be blank"])
    end
    it 'should error when category is empty' do
      @category = Category.new
      @product = Product.new(
        name: 'Women\'s Zebra pants' ,
        price: 124.99,
        quantity: 124.99,
        category: nil
      )
      @product.save
      expect(@product.errors.full_messages).to eq(["Category can't be blank"])
    end
  end
end