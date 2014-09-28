require 'order'

describe Order do
  let(:order   ) { Order.new        }
  let(:subtotal) { double :subtotal }

  it "should hold a list of sub_totalled items" do
    order.items << subtotal
    expect(order.items.count).to eq 1
  end

  it "should total the items in it's items array" do
    expect(order.total).to be_a(Fixnum)
  end
end