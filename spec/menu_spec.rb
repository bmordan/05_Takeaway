require 'menu'

describe Menu do
  let(:menu) { Menu.new }
  let(:dish) { double :dish}

  it "should be able to add a dish to the menu" do
    menu.items << dish
    expect(menu.items.count).to eq (1)
  end

end