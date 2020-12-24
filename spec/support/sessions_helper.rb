module SessionsHelper
  def capybara_login user
    page.set_rack_session(user_id: user.id)
  end
end
