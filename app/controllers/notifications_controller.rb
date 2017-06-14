class NotificationsController < ApplicationController

  def create
    TalkTexter.alert(notifications_params[:name], notifications_params[:phone]).deliver
    flash[:notice] = 'Success! Your phone should light up any second now.'
    redirect_to root_url
  rescue Twilio::REST::RequestError => error
    p error.message
    flash[:danger] = "Oops! There was an error. #{error.message}. Please try again or shake your fist at Rylan with silent rage."
    redirect_to root_url
  end

  private

  def notifications_params
    params.require(:notifications).permit(:name, :phone)
  end

end
