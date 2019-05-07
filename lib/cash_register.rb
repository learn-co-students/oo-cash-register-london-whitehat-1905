class CashRegister
    attr_accessor   :total, :discount
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        @total += price * quantity
        for i in (0...quantity)
            @items << title
        end
    end

    def apply_discount
        if @discount == 0
            return "There is no discount to apply."
        else
        @total *= (1 - (@discount/100.0))
        #integer division always rounds down
        #using 100 as a float guarentees the result will be a float
        "After the discount, the total comes to $#{@total.to_i}."
        end
    end 

    def items
        @items
    end

    def void_last_transaction
        @total = 0
    end

end

