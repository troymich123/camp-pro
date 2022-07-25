class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  before_action :set_avatar

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :avatar])
  end

  def set_avatar
    @myuser = User.find(current_user[:id]) if user_signed_in?
  end

  def set_search
    @search = Post.ransack(params[:q])
    @posts = @search.result.order(created_at: :desc).page(params[:page]).per(6)
  end
end
