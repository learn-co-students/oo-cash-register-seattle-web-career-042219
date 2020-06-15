require 'pry'

class CashRegister
  attr_accessor :total, :discount, :cart

  def initialize(discount = 0)
    @discount = discount
    @total = 0.00
    @cart = []
  end

  def add_item(item, cost, quantity = 1)
    @last_trans = cost*quantity
    @total += @last_trans
    quantity.times do
    @cart << item
    end
  end

  def apply_discount
    if discount == 0
      'There is no discount to apply.'
    else
      d_total = total * (1 - discount.to_f / 100)
      d_total.round(2)
      d_total = d_total.to_i if d_total == d_total.to_i
      @total = d_total
      "After the discount, the total comes to $#{d_total}."
    end
  end

def items
  return @cart
end

def void_last_transaction
  @total -= @last_trans
end

end
