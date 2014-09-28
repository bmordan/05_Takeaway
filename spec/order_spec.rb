require 'order'

describe Order do
  let(:customer) { double :customer, name: 'Bob', phone: '#'}
  let(:order   ) { Order.new(customer) }
  let(:subtotal) { double :subtotal    }

  it "should hold a list of sub_totalled items" do
    order.items << subtotal
    expect(order.items.count).to eq 1
  end

  it "should total the items in it's items array" do
    expect(order.total).to be_a(Float)
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

end