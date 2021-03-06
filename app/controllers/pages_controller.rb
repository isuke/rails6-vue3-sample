class PagesController < ApplicationController
  before_action :redirect_logout_user, only: %i[mypage]

  def home
    render 'empty'
  end

  def signup
    render 'empty'
  end

  def login
    render 'empty'
  end

  def mypage
    render 'empty'
  end

  private

  def redirect_logout_user
    unless logged_in?
      redirect_to login_url
    end
  end
end
