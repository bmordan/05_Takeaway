class LineItem

  attr_reader :dish
  attr_reader :quantity

  def initialize(dish,quantity)
    @dish = dish
    @quantity = quantity
  end

end