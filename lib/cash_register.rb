class CashRegister
    attr_accessor :total, :items, :quantity, :discount, :transaction_counter

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end
    

    def add_item(item, total, quantity = nil)
        @quantity = quantity
        
        if quantity == nil
            @total += total
            @items << item
        else
            @total += (total * quantity)
            quantity.times do
                @items << item 
            end
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
        @items.pop
        @total -= @total
    end
end
