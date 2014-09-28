require 'rubygems'
require 'twilio-ruby'

class Send
  attr_reader :account
  attr_reader :auth_token
  attr_reader :client

  def initialize
    @account = 'AC4e232884962eb7b43ea75dd4ce8348dc'
    @auth_token = 'a78b72343bbebc9e8541e65a969da90f'
    @client = Twilio::REST::Client.new @account, @auth_token
  end

  def message(to,from,body)
    "message: " << body
  end

end 
# account_sid = 'AC4e232884962eb7b43ea75dd4ce8348dc'
# auth_token = 'a78b72343bbebc9e8541e65a969da90f'
# @client = Twilio::REST::Client.new account_sid, auth_token
 
# message = @client.account.messages.create(
#   :body => "Siriol. Queen of the interfaith niks x x",
#   :to => "+447944985775",
#   :from => "+441275595071")
# puts message.sid