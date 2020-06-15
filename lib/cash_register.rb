require 'pry'

class CashRegister

  attr_accessor :discount, :total

  @@all_hash = {}
  @@all_arr = []

  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @hash = {}
    @arr = []
  end

  def add_item(title, price, quantity=1)
    @@all_hash[title] = {price: price, quantity: quantity}
    @hash[title] = {price: price, quantity: quantity}
    quantity.times do
      @@all_arr << title
    end
    quantity.times do
      @arr << title
    end
    @total += price*quantity
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total = @total * (1 - (@discount / 100.00))
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    @arr
  end

  def void_last_transaction
    item = @@all_arr.pop
    price = @@all_hash[item][:price] * @@all_hash[item][:quantity]
    @total = @total - price
  end

end
