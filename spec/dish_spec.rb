require 'dish'

describe Dish do
  
  let(:dish) { Dish.new }

  it "should have a dish" do
    tuna = Dish.new("tuna",2.3)
    expect(tuna.dish).to eq("tuna")
  end

  it "should have a price" do
    tuna = Dish.new("tuna",2.3)
    expect(tuna.price).to eq(2.3)
  end  

end