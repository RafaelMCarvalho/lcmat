module RailsAdmin
  module Extensions
    module CanCan
      class AuthorizationAdapter
        private
        module ControllerExtension
          def current_ability
            @current_ability ||= @ability.new(_current_user, self.params["model_name"])
          end
        end
      end
    end
  end
end