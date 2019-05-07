class CashRegister
attr_accessor :total, :discount, :last_transaction_price, :item
  def  initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []

  end



  def add_amount(item, prices, quantity = 1)
    cost = prices * quantity
  end
  def add_item(item, prices, quantity = nil)
    if quantity != nil
      @total = (prices * quantity) + @total
      quantity.times do
      @items << item
      end
    else
      @total = prices + @total
      @items << item
  end

  end
  def apply_discount
    if @total == 0
      "There is no discount to apply."
    else
    @total = (@total * 0.80)
    "After the discount, the total comes to $#{@total.floor}."
    end
  end
  def items
    @items
  end
  def void_last_transaction
    @total = @total - @total
  end
  end
