require 'sub_total'

describe SubTotal do

  let(:dish) { double :dish         }
  let(:sub ) { SubTotal.new(dish,5) }
  
  it "should take a dish and a quantity" do
    expect(sub.quantity).to eq(5)
  end

  it "should subtotal" do
  allow(dish).to receive(:price).and_return 2.3
  expect(sub.subtotal).to eq 11.5
  end

end