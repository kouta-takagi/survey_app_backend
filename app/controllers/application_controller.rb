class ApplicationController < ActionController::API
        include DeviseTokenAuth::Concerns::SetUserByToken
  def test
    render json: { message: "This is a test message from Rails" }
  end
end
