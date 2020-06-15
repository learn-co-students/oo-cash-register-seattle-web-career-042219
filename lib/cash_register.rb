class CashRegister
  attr_accessor :total, :price, :discount
  #attr_reader :item

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @item =[]
  end

  def add_item(title, price, quantity=1)
    @total += price * quantity
    i = 0
    while i < quantity
      @item << title
      i += 1
    end
    @price = price
  end

  def apply_discount
    if self.discount == 0
      "There is no discount to apply."
    else
      @total *= (1 - @discount / 100.0)
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    @item
  end

  def void_last_transaction
    @item.pop
    @total -= @price
  end

end
