class AddUserRoles < ActiveRecord::Migration
  def up
    Role.create(:name => 'integra_user_manager', :display_name => 'Controlador de Usuário')
    Role.create(:name => 'integra_user_viewer', :display_name => 'Visualizador de Usuário')    
  end

  def down
    Role.find_by_name('integra_user_manager').destroy
    Role.find_by_name('integra_user_viewer').destroy
  end
end
