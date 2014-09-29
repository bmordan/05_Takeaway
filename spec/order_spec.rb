require 'order'

describe Order do
  let(:customer) { double :customer, name: 'Bob', phone: '#'}
  let(:order   ) { Order.new(customer) }
  let(:subtotal) { double :subtotal    }
  let(:dish    ) { double :dish        }

  it "should hold a list of sub_totalled items" do
    order.items << subtotal
    expect(order.items.count).to eq 1
  end

  it "should initalize with a customer object" do
    allow(customer).to receive(:name).and_return('Bob')
    expect(order.name).to eq('Bob')
  end

  it "should calculate the right delivery time" do
    time = Time.now
    hour = (time.hour+1).to_s
    min = time.min.to_s
    right_time = "#{hour}:#{min}"
    expect(order.delivery_time).to eq(right_time)
  end 

  it "should return the total correctly formatted" do
    #allow(dish).to receive(:subtotal).and_return(5.678)
    #2.times {order.items << dish}
    #expect(lambda {order.total}).to raise_error(RuntimeError)
    expect(order.total).to eq('0.00')
  end

end