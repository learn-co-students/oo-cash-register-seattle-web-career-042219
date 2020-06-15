class CashRegister
	attr_accessor :total, :items, :prev_total, :prev_items
	attr_reader :discount

	def initialize(discount = 0)
		@total = 0
		@discount = discount
	end

	def total
		@total
	end

	def add_item(title, price, quantity = 1)
		self.prev_total = self.total
		self.total += price * quantity
		self.items ||= []
		self.prev_items = self.items
		quantity.times { self.items << title }
	end

	def apply_discount
		@total = (self.total * 0.8)
		if self.discount == 0
			message = "There is no discount to apply."
		else
			message = "After the discount, the total comes to $#{self.total.round}."
		end
	end

	def items
		@items
	end

	def void_last_transaction
		self.total = self.prev_total
		self.items = self.prev_items
	end
end
