class IntegraEngineMigrated < ActiveRecord::Base
  belongs_to :integra_engine
  attr_accessible :original_version, :migrated_version, :integra_engine_id
end



