class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    # ここから追加します
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def after_sign_in_path_for(resource)
      users_root_path
    end
  
    def after_sign_out_path_for(resource_or_scope)
      # デフォルトはroot_path
      new_user_session_path
    end
  
        private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
    end
    # ここまで追加します

end
