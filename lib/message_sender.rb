class MessageSender
  def self.send_message(message, user_phone)
    new.send_message(message, user_phone)
  end

  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token  = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_message(message, user_phone)
    @client.account.messages.create(
      from:  twilio_number,
      to:    user_phone,
      body:  message
    )
  end

  private

  def twilio_number
    twilio_number = ENV['TWILIO_NUMBER']
  end
end
