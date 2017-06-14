class TalkTexter < Textris::Base
  default :from => ENV["TWILIO_NUMBER"]

  def alert(name, user_phone)
    @name = name
    text to: user_phone
  end
end
