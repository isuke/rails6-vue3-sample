class Api::SessionsController < Api::ApiController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      login user
      render(
        json: { message: 'login successs' },
        status: :ok,
      )
    else
      render_forbidden
    end
  end

  def destroy
    logout
    render(
      json: { message: 'logout successs' },
      status: :ok,
    )
  end

  def user_params
    params.permit(:email, :password)
  end
end
