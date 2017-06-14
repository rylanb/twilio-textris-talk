class TalkTexter < Textris::Base
  default :from => ENV["TWILIO_NUMBER"]

  def alert(name, user_phone)
    puts "name: #{name}. Phone: #{user_phone}\n\n"
    @name = name
    text to: user_phone
  end
end
