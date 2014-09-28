require 'give_me'

describe GiveMe do

  let(:dish    ) { double :dish         }
  let(:giveme) { GiveMe.new(dish,5) }
  
  it "should take a dish and a quantity" do
    expect(giveme.quantity).to eq(5)
  end

end