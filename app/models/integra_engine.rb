class IntegraEngine < ActiveRecord::Base
  resourcify
  attr_accessible :module_name, :display_name
  has_many :roles, :as => :resource
  
  validates_uniqueness_of :module_name, :display_name
end
