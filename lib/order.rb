class Order

  def items
    @items ||= []
  end

  def total
    items.inject(0) {|total,subtotal| total + item.subtotal}
  end
  
end