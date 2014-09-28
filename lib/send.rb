require 'rubygems'
require 'twilio-ruby'

class Send
  attr_reader :account_sid
  attr_reader :auth_token
  attr_reader :client
  attr_reader :from

  def initialize
    @account_sid = 'AC4e232884962eb7b43ea75dd4ce8348dc'
    @auth_token = 'a78b72343bbebc9e8541e65a969da90f'
    @from = '+441275595071'
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def message(to,body)
    @client.messages.create(
      :body => body,
      :to => to,
      :from => @from
    )
    "message: " << body
  end

end