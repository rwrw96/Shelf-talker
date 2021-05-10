class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    
# 新規登録時nameも追加する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) 
  end
  
#　ログアウト時新規登録画面に遷移
  def after_sign_out_path_for(resource)
     new_user_registration_path 
  end
end
