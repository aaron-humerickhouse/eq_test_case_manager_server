# frozen_string_literal: true

class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /user/sign_up
  # def new
  #   super
  # end

  # POST /user
  def create
    build_resource(sign_up_params)

    if resource.save
      render_resource(resource)
    else
      render json: {
        errors: resource.errors,
      }, status: :bad_request
    end
  end

  # GET /user/edit
  # def edit
  #   super
  # end

  # PUT /user
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroyuser
  #   super
  # end

  # GET /user/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
  
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
