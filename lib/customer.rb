class Customer

  attr_reader :phone
  attr_reader :name
  
  def initialize(options = {})
    @phone = options.fetch(:phone, '+447944985775')
    @name = options.fetch(:name, 'Customer')
  end

end