require_relative './send'

class Customer

  attr_reader :phone
  attr_reader :name
  
  def initialize(options = {})
    @name = options.fetch(:name, 'Customer')
    @phone = options.fetch(:phone, '+447944985775')
  end

  def place(order)
    sms = "Thank you #{@name}! Your order was placed and will be delivered before #{order.delivery_time}, and you will be charged £ #{order.total}."
    send = Send.new
    send.message(@phone,sms)
  end

end