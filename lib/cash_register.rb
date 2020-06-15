require "pry"

class CashRegister

    attr_accessor :total, :discount, :cart, :last

    def initialize(discount = 0)
      @total = total
      @total = 0
      @discount = discount
      @cart = []
      @last = nil
    end

  def add_item(title, price, quantity = 1)
    quantity.times do
      @cart.push(title)
    end
    #@cart << title
    item_total = price * quantity
    @total += item_total
    @last = @total
  end

  def apply_discount
    if @discount != 0
      saving = @total * (@discount/100.00)
      @total = @total - saving
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @cart
  end

  def void_last_transaction
    @total -= @last 
  end

end
