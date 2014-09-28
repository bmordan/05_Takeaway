require 'order'

describe Order do
  let(:order) {Order.new}

  it "should hold a list of sub_totalled items" do
    expect(order.total).to be_a(Fixnum)
  end
end