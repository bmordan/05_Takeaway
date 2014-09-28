class Order

  attr_reader :name
  attr_reader :phone

  def initialize(customer)
    @name = customer.name
    @phone = customer.phone
  end

  def items
    @items ||= []
  end

  def total
    total = items.inject(0) {|total,item| total + item.subtotal}
    (total).round(2)
  end

  def delivery_time
    time = Time.now
    hour = (time.hour+1).to_s
    min = time.min.to_s
    "#{hour}:#{min}"
  end
  
end