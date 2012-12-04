require "integra_engine_detector/engine"

module IntegraEngineDetector
  
  def self.setup
    yield self
  end 
  
  mattr_accessor :integra_engines  
end

