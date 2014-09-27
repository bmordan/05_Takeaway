require 'line_item'

describe LineItem do

  let(:dish    ) { double :dish         }
  let(:lineitem) { LineItem.new(dish,5) }
  

  it "should take a dish and a quantity" do
    expect(lineitem.quantity).to eq(5)
  end
end