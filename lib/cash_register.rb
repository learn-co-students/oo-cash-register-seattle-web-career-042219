require 'pry'

class CashRegister

  attr_accessor :total, :discount, :title, :price, :quantity, :ary, :price_ary, :new_total, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @ary = []
    @price_ary = []
  end

  def add_item(title, price, quantity = 1)
    @total =  @total + (price * quantity)
    @price_ary << price

    count = 0
    while count < quantity
      @ary << title
      count += 1
    end
  end

  def apply_discount
    if @discount != 0
      @total = @total - (@total*(@discount/100.0))
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    @ary
  end

  def void_last_transaction
binding.pry
    @total = @total - @price_ary.pop
    #binding.pry
  end

end
