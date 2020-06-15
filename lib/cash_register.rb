require 'pry'

class CashRegister
  attr_accessor :total, :discount, :cart, :final_tab, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @cart = []
    @last_transaction = []
  end

  def add_item(item, price, quantity = 1)
        self.total += (price * quantity)
        quantity.times do
        @cart << item
        @last_transaction << price
      end
      self.final_tab = (price * quantity)
  end

  def apply_discount
    if discount <= 0
      "There is no discount to apply."
    else
      self.total = @total - (@discount * 0.01 * @total)
      "After the discount, the total comes to $#{total.to_i}."
    end
  end

  def items
    @cart
  end

  def void_last_transaction
    @total = @total - @last_transaction.pop
  end
end
