require "rails_admin_approve_events/engine"

module RailsAdminApproveEvents
end
module RailsAdmin
  module Config
    module Actions
      class ApproveEvents < RailsAdmin::Config::Actions::Base
				RailsAdmin::Config::Actions.register(self)

        register_instance_option :visible? do
          bindings[:abstract_model].to_s == "Event"
        end
        register_instance_option :http_methods do
          [:get, :post]
        end

				register_instance_option :controller do
					Proc.new do
            if request.post? 
              @objects = list_entries(@model_config, :approve_events)
              count = 0
              @objects.each do |object|
                if object.published == "published" 
                   object.update_attribute(:approved, true)  
                   count = count + 1
                end    
              end  
              flash[:notice] = "You have approved #{count} event(s)."
              redirect_to back_or_index
            else
              render @action.template_name
            end
          end
				end
				register_instance_option :bulkable? do
          true
        end			 
				register_instance_option :link_icon do
          'icon-share'
        end				
      end
    end
  end
end