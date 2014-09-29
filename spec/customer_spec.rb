require 'webmock/rspec'
require 'customer'

describe Customer do
  let(:customer) { Customer.new  }
  let(:order   ) { double :order }
  let(:send    ) { double :send  }
  let(:sms     ) { double :sms   }

  it "should have a phone number" do
    expect(customer.phone).to eq('+447944985775')
  end

  it "should have a name that defaults to Customer" do
    expect(customer.name).to eq('Customer')
  end

  it "should handle a customer placing an order" do
    WebMock.stub_request(:post, "https://AC4e232884962eb7b43ea75dd4ce8348dc:a78b72343bbebc9e8541e65a969da90f@api.twilio.com/2010-04-01/Accounts/AC4e232884962eb7b43ea75dd4ce8348dc/Messages.json").
         with(:body => {"Body"=>"Thank you Customer! Your order was placed and will be delivered before ", "From"=>"+441275595071", "To"=>"+447944985775"},
              :headers => {'Accept'=>'application/json', 'Accept-Charset'=>'utf-8', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>'twilio-ruby/3.13.0 (ruby/x86_64-darwin13.0.0 2.0.0-p353)'}).
         to_return(:status => 200, :body => "{}", :headers => {})
    allow(customer).to receive(:phone)
    allow(order).to receive(:delivery_time)
    allow(order).to receive(:total)
    expect_any_instance_of(Send).to receive(:message)
    customer.place(order)
  end

end