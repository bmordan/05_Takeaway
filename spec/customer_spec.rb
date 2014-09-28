require 'customer'

describe Customer do
  let(:customer) {Customer.new}

  it "should have a phone number" do
    expect(customer.phone).to eq('+447944985775')
  end

  it "should have a name that defaults to Customer" do
    expect(customer.name).to eq('Customer')
  end  
end