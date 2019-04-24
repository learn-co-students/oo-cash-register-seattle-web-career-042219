require 'pry'

class CashRegister
  attr_accessor :discount, :total, :basket, :amt
  # attr_reader :basket


  def initialize(discount=0)
    @discount = discount
    @total = 0
    @basket = []
  end

  def add_item(title, price, quantity=1)
    quantity.times do
      @basket << title
    end
    @amt = @total += (price * quantity)
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total -= @total * (@discount / 100.00)
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    @basket
  end

  def void_last_transaction
    @total -= @amt
  end

end
