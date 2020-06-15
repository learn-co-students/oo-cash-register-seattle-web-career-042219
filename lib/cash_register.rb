require 'pry'
class CashRegister

  attr_accessor :total, :discount, :final_amount

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    i = 0
    until i == quantity
      @items << title
      i += 1
    end
    @total += price * quantity
    @final_amount = @total
    @items
  end

  def apply_discount
    if @discount > 0
      self.total =  @total - (@discount*0.01*@total)
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @final_amount
  end

end
