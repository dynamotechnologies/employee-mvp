class FeedbackController < ApplicationController
  before_action :authenticate_user!, only: :show

  def enter
    @rating ||= Rating.new
  end

  def create
    @rating = Rating.new giver: params[:rating][:giver], receiver: params[:rating][:receiver], desc: params[:rating][:desc]

    if @rating.save
      redirect_to feedback_thanks_path, notice: 'Feedback was successfully created.'
    else
      render feedback_enter_path
    end
  end

  def thanks

  end

  def show
  end
end
