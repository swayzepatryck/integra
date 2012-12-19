module ApplicationHelper
  def flash_class(level)
    case level
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-error"
    when :alert then "alert alert-error"
    end
  end
  
  def c(object)
    object.blank? ? "<<#{t('general.no_record_found')}>>" : object
  end


	def get_has_manies_and_belongs_to
		 model_name = controller_name.classify
		 
		 Rails::Application::Railties.engines.each do |e| 
	     #model_name = e.is_a?(Rails::Engine) ? e.engine_name : "andrea"
			 puts params[:controller]
		 end 		

     model_name			
	end
	
	#### Icone de editar #####
  def edit_icon
    "<i class='icon-edit'></i>".html_safe
  end
  
  def destroy_icon
    "<i class='icon-trash'></i>".html_safe
  end
  
  def back_icon
    "<i class='icon-circle-arrow-left'></i>".html_safe
  end
  

   
end
