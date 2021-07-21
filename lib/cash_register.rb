
class CashRegister

    attr_accessor :total
    attr_accessor :discount
    attr_accessor :items
    attr_accessor :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, qty = 1)
        self.last_transaction = price * qty
        self.total += self.last_transaction
        qty.times do
            self.items << title
        end
    end

    def apply_discount
        if self.discount != 0
            discount_percentage = (100.0 - self.discount.to_f) / 100
            self.total = (self.total * discount_percentage).to_i
            # disc_amt = (20 / 100) * (price * qty)
            # self.total = (price * qty) - disc_amt

            "After the discount, the total comes to $#{self.total}."
        else 
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end

end