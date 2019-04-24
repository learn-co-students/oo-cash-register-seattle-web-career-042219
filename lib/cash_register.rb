
class CashRegister
  attr_accessor :total, :title, :price, :discount, :quantity, :itemsArray
  ItemsTracker = []




  def initialize (discount=nil)
    @total = 0
    @discount = discount
    @itemsArray = []
  end

  def total
    @total
  end

  def add_item(title, price, quantity=1)
    ItemsTracker<< price
    itemsArray.fill(title, itemsArray.length, quantity)
    @quantity = quantity
    @total+=price*@quantity
    @total
  end

  def items
    itemsArray
  end

  def apply_discount
    if discount == nil
      "There is no discount to apply."
    else
      dis = self.total * @discount / 100.00
      @total = self.total - dis
      money = @total.to_i
      "After the discount, the total comes to $#{money}."
    end
  end

  def void_last_transaction
  lastTransaction = ItemsTracker.pop
  @total = @total - lastTransaction
  end
 end
