class IntegraEngineMigration < ActiveRecord::Base
  belongs_to :integra_engine
  attr_accessible :migration, :version, :integra_engine_id
end
