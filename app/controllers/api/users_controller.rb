class Api::UsersController < Api::ApiController
  before_action :render_error_if_logout_user, except: %i[create]

  def show
    user = User.find(params[:id])
    render(
      json: {
        id: user.id,
        email: user.email,
      }
    )
  end

  def create
    user = User.new(user_params)

    if user.save
      login user
      render_action_model_success_message(user, :create)
    else
      render_action_model_fail_message(user, :create)
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
