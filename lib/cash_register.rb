require 'pry'
class CashRegister
  attr_accessor :total, :last_transaction
  attr_reader :discount


  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @item_array = []
    @last_transaction = 0
    # @item_array = []
  end

  def add_item(item,price,quantity=1)
    self.total += price*quantity
    self.last_transaction = price*quantity
      i=0
      while i < quantity
        self.items = item
        i += 1
      end
  end

  def apply_discount
    if self.discount == 0
      "There is no discount to apply."
    else
    self.total = self.total - (self.discount.to_f/100)*self.total
    "After the discount, the total comes to $#{self.total.to_i}."

  end
  end

   def items
  #   self.item_array
    @item_array
   end

   def items=(item)

     @item_array << item
     #binding.pry
   end

   def void_last_transaction
     self.total = self.total - self.last_transaction
   end


end
