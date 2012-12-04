class AddIntegraNewsRoles < ActiveRecord::Migration
  def up
    Role.create(:name => 'blogguer', :display_name => 'Blogueiro Integra News', :resource_id => IntegraEngine.find_by_module_name('IntegraNews').id, :resource_type => 'IntegraEngine')  
  end

  def down
    Role.where("name = 'blogguer' and display_name = 'Blogueiro Integra News' and resource_id = #{IntegraEngine.find_by_module_name('IntegraNews').id}").destroy
  end 
end
