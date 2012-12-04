module IntegraEngineDetector
  class Engine < ::Rails::Engine
    isolate_namespace IntegraEngineDetector
    initializer 'integra_engine_detector.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper IntegraEngineDetector::ApplicationHelper
      end
    end
    
  end
end
