class RegistrationsController < Devise::RegistrationsController

def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)

	if params[resource_name]
    any_passwords = %w(password password_confirmation current_password).any? do |field|
      params[resource_name][field].present?
    end
    end

    update_method = any_passwords ? :update_with_password : :update_without_password

    if resource.send(update_method, params[resource_name])
      #set_flash_message :notice, :update if is_navigational_format?
      flash[:notice] = "Account updated successfully"
      sign_in resource_name, resource, :bypass => true
      respond_with resource, :location => after_update_path_for(resource)
    else
      clean_up_passwords(resource)
      respond_with_navigational(resource){ render_with_scope :edit }
    end

  end
  


end
