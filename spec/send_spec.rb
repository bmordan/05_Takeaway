require 'rubygems'
require 'twilio-ruby'
require 'send'

describe Send do
  let(:send      ) { Send.new                             }
  let(:account   ) { 'AC4e232884962eb7b43ea75dd4ce8348dc' }
  let(:auth_token) { 'a78b72343bbebc9e8541e65a969da90f'   }
  let(:to        ) { '+447944985775' }
  let(:from      ) { '+441275595071' }
 
  it "should have an account_sid" do
    expect(send.account).to eq(account)
  end

  it "should have an auth_token" do
    expect(send.auth_token).to eq('a78b72343bbebc9e8541e65a969da90f')
  end

  it "should have a client class that inherits from the twilio gem" do
    expect(send.client).to respond_to(:account)
  end

  it "should be able to construct a message" do
    expect(send.message(to,from,"my message")).to eq("message: my message")
  end
end