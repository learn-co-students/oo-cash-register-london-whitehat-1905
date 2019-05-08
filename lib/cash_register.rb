class CashRegister

  attr_accessor :total, :discount
  def initialize(discount = 0, total = 0, allItems = [])
    @total = total
    @discount = discount
    @allItems = allItems
  end

  def discount
    @discount
  end

  def add_item(title,price,quantity=1)
    quantity.times{ @allItems << title }
    @total = @total + (price * quantity)
    @undo = Proc.new {
      @allItems.delete(title)
      @total = @total - (price * quantity)
    }
  end




  def apply_discount
    if @discount != 0
      @total = @total - (@total * (self.discount.to_f/100))
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @allItems
  end

  def void_last_transaction
    @undo.call
  end

end
