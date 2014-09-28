require 'webmock/rspec'
require 'send'

describe Send do
  
  let(:send       ) { Send.new                             }
  let(:account_sid) { 'AC4e232884962eb7b43ea75dd4ce8348dc' }
  let(:auth_token ) { 'a78b72343bbebc9e8541e65a969da90f'   }
  let(:to         ) { '+447944985775'    }
  let(:from       ) { '+441275595071'    }
  let(:body       ) { 'my_message'       }

  context "Set up" do

    it "should have an account_sid" do
      expect(send.account_sid).to eq(account_sid)
    end

    it "should have an auth_token" do
      expect(send.auth_token).to eq('a78b72343bbebc9e8541e65a969da90f')
    end

    it "should have a client class that inherits from the twilio gem" do
      expect(send.client).to respond_to(:account_sid)
    end

    it "should have my twilio number in send.from" do
      expect(send.from).to eq(from)
    end

  end

  context "Sending functionality" do

    WebMock.disable_net_connect!(allow_localhost: true)

    it "webmock set up correctly" do
      WebMock.stub_request(:any,"www.google.co.uk")
      Net::HTTP.get("www.google.co.uk", "/")
    end
   
    it "requests @api.twilio.com" do
      WebMock.stub_request(:post, "https://AC4e232884962eb7b43ea75dd4ce8348dc:a78b72343bbebc9e8541e65a969da90f@api.twilio.com/2010-04-01/Accounts/AC4e232884962eb7b43ea75dd4ce8348dc/Messages.json").
         with(:body => {"Body"=>"my_message", "From"=>"+441275595071", "To"=>"+447944985775"},
              :headers => {'Accept'=>'application/json', 'Accept-Charset'=>'utf-8', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>'twilio-ruby/3.13.0 (ruby/x86_64-darwin13.0.0 2.0.0-p353)'}).
         to_return(:status => 200, :body => "{}", :headers => {})
      expect(send.message(to,body)).to eq("my_message")
    end

    it "Should return a message with a time" do
      WebMock.stub_request(:post, "https://AC4e232884962eb7b43ea75dd4ce8348dc:a78b72343bbebc9e8541e65a969da90f@api.twilio.com/2010-04-01/Accounts/AC4e232884962eb7b43ea75dd4ce8348dc/Messages.json").
         with(:body => {"Body"=>"2014-09-28 20:11:08 +0100", "From"=>"+441275595071", "To"=>"+447944985775"},
              :headers => {'Accept'=>'application/json', 'Accept-Charset'=>'utf-8', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>'twilio-ruby/3.13.0 (ruby/x86_64-darwin13.0.0 2.0.0-p353)'}).
         to_return(:status => 200, :body => "{}", :headers => {})
      time = '2014-09-28 20:11:08 +0100'   
      expect(send.message(to,time)).to eq("#{time}")
    end


  end
  
end