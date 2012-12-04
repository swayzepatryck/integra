class CreateAdminUser < ActiveRecord::Migration
  def up
    admin = User.new(
      :email => "dtic@ifb.edu.br",
      :encrypted_password => "$2a$10$SX626fjNVOXlNjMxd9pO2O.UeMQLHcJqDvXxw5uVUJgBRkPetaXMq",
      :name => "Administrador do Sistema",
      :login => "admin",
      :admin => true
    )
    admin.save(:validate => false)
  end

  def down
    User.find_by_login('admin').destroy
  end
end
