class Order

  def items
    @items ||= []
  end

  def total
    items.inject(0) {|total,item| total + item.subtotal}
  end
  
end