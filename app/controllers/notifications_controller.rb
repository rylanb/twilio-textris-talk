class NotificationsController < ApplicationController

  def create
    AgentTexter.alert(params, user_phone).deliver
    redirect_to root_url
      flash[:notice] = 'Success! Your phone should be pinged any second now'
  rescue Twilio::REST::RequestError => error
    p error.message
    redirect_to root_url,
      flash[:danger] = 'Oops! There was an error. Please try again.'
  end

  private

  def user_phone
    params[:notifications][:user_phone]
  end
end
