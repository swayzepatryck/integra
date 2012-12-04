module IntegraEngineDetector
  module ApplicationHelper
    def show_integra_engines    
       html = "<div class='row-fluid'>"
      
       get_integra_engines.each do |engine|
        html = html + " 	
          		<div class='span4'>
         	      <div class='hero-unit' style='background-color:#{engine::well_background};min-height: 290px;padding: 20px 20px 20px 20px;'>
         			  <h2>
         				  <i class='#{engine::engine_icon_class} icon-large'></i>
         				  #{link_to engine::title, engine::path, :style => 'color: #333333'}
         			  </h2>
         			  <hr/>
         			  <br/>
                <div class='well' style='min-height: 120px;background-color: #FFFFFF;'>
         			    <p style='text-align: justify;'>#{engine::description}</p>
                </div>
         			  <br/>
         		  </div>
         		</div>"
       end
       html = html + "</div>"       

       html.html_safe
     end  
     
     def flash_class(level)
       case level
       when :notice then "alert alert-info"
       when :success then "alert alert-success"
       when :error then "alert alert-error"
       when :alert then "alert alert-error"
       end
     end       
     
     def show_flash_messages
       "#{render 'integra_engine_detector/shared/flash_messages' }".html_safe
     end
     
     def get_integra_engines
       integra_engines = Array.new

       Rails::Application::Railties.engines.each do |e|
         #integra_engine flag que identifica engine integra
         if defined?(e.class.to_s.split('::')[0].camelize.constantize::integra_engine)
            # Exibe a engine se for publica.
            if e.class.to_s.split('::')[0].camelize.constantize::public_engine
              integra_engines << e.class.to_s.split('::')[0].camelize.constantize  
            else         
              # Verifica se o usuário atual possui algum perfil na engine atual da iteracao.
              current_user.roles.where('resource_type is not null').each {|role| 
                if current_user.admin? or e.class.to_s.split('::')[0].camelize.constantize.to_s == role.resource.module_name.to_s
                  integra_engines << e.class.to_s.split('::')[0].camelize.constantize  
                end
              }             
            end
         end          
       end  
       integra_engines
     end  
     
     def set_integra_flash_message(key, kind, options={})
       options[:scope] = "devise.#{controller_name}"
       options[:default] = Array(options[:default]).unshift(kind.to_sym)
       options[:resource_name] = resource_name
       options = devise_i18n_options(options) if respond_to?(:devise_i18n_options, true)
       message = I18n.t("#{resource_name}.#{kind}", options)
       flash[key] = message if message.present?
     end
     
     def integra_error_messages!(object)
       return "" if object.errors.empty?

       messages = object.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
       sentence = I18n.t("errors.messages.not_saved",
                         :count => object.errors.count,
                         :resource => object.class.model_name.human.downcase)

       html = <<-HTML
       <div id="error_explanation">
         <h2>#{sentence}</h2>
         <hr>
         <ul>#{messages}</ul>
       </div>
       HTML
       
       flash[:error] = html.html_safe       
     end
     
     
     
     def user_session_manager
       "<div class='btn-group pull-right'>
		            <a class='btn dropdown-toggle' data-toggle='dropdown' href='#'>
		              <i class='icon-user'></i> #{current_user.name}
		              <span class='caret'></span>
		            </a>
		
		            <ul class='dropdown-menu'>
		              <li><a href='#'>Perfil</a></li>
		              <li class='divider'></li>
					  <li><a rel='nofollow' data-method='delete' href='/seguranca/users/sign_out'>Sair</a></li>
		            </ul>
	            </div>
			".html_safe
     end     
  end
end
