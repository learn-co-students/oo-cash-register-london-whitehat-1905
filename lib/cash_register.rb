class CashRegister
  attr_accessor :discount, :items, :total

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = nil
  end

  def add_item(name, price, quantity = 1)
    @total += price*quantity
    quantity.times { @items << name }
    @last_transaction = { name: name, price: price, quantity: quantity }
  end

  def apply_discount
    return "There is no discount to apply." if @discount.nil?
    @total -= @total*@discount/100.to_i
    return "After the discount, the total comes to $#{@total}."
  end

  def void_last_transaction
    @items = @items.reverse.drop(@last_transaction[:quantity]).reverse
    @total -= @last_transaction[:price]*@last_transaction[:quantity]
  end

end
