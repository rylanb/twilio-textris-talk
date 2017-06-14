class AgentTexter < Textris::Base
  default :from => ENV["TWILIO_NUMBER"]

  def alert(params, user_phone)
    @params = params
    text :to => user_phone
  end
end
