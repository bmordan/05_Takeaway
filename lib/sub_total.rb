class SubTotal

  attr_reader :dish
  attr_reader :quantity

  def initialize(dish,quantity)
    @dish = dish
    @quantity = quantity
  end

  def subtotal
    dish.price * quantity
  end

end