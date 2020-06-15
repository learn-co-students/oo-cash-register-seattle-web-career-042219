class CashRegister
  attr_accessor :total, :discount, :items

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity = 1)
    @total += price * quantity
    i = quantity
    while i > 0
      @items << item
      i -= 1
    end
  end

  def apply_discount
    if @discount > 0
      @total -= (@total * discount)/100
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total = 0
  end
end
