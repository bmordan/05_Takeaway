require_relative './dish'

class Menu

  def initialize
    dishes = [
      Dish.new("Rice",1.2),
      Dish.new("Chips",0.9),
      Dish.new("Pork & Crab",2.3),
      Dish.new("Baby Octopus",1.9),
      Dish.new("Spare Ribs",3.2)
    ]
    dishes.each {|dish| items << dish}
  end

  def items
    @items ||= []
  end

end