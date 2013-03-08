require "rails_admin_approve_events/engine"

module RailsAdminApproveEvents
end
module RailsAdmin
  module Config
    module Actions
      class ApproveEvents < RailsAdmin::Config::Actions::Base
				RailsAdmin::Config::Actions.register(self)

        register_instance_option :http_methods do
          [:get, :post]
        end

				register_instance_option :controller do
					Proc.new do

            if request.post? 
              @objects = list_entries(@model_config, :destroy)
              render @action.template_name
            else
              render @action.template_name
            end
          end
				end
				register_instance_option :bulkable? do
          parent_model = bindings[:abstract_model].try(:config).try(:parent)
          puts parent_model
          true
        end			 
				register_instance_option :link_icon do
          'icon-share'
        end				
      end
    end
  end
end