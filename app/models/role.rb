class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true
  
  attr_accessible :integra_engine_id, :name, :display_name, :resource_id, :resource_type
end
