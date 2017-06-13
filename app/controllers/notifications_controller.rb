class NotificationsController < ApplicationController
  require '././lib/message_sender'

  def create
    MessageSender.send_message(message, user_phone)
    redirect_to root_url,
      success: 'Success! Your phone should be pinged any second now'
  rescue Twilio::REST::RequestError => error
    p error.message
    redirect_to root_url,
      error: 'Oops! There was an error. Please try again.'
  end

  private

  # def notification_params
  #   params.require(:notification).permit(:name, :user_phone)
  # end

  def message
    "Hey there #{params[:notifications][:name]}, here's the link to more info: https://github.com/rylanb/twilio-textris-talk"
  end

  def user_phone
    params[:notifications][:user_phone]
  end
end
