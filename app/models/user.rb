require 'extend_string'

class User < ActiveRecord::Base
  rolify
  apply_simple_captcha
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :omniauthable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauth_providers => [:ldap]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :login, :role_ids, :admin, :encrypted_password, :captcha, :captcha_key, :employee
  # attr_accessible :title, :body  
  
  validates_presence_of :name, :login, :email, :password, :password_confirmation
  
  # gera um password generico para os usuarios que logarem com ldap_authenticatable.
  # isso supera o furo de segurança de salvar um usuario sem nenhuma senha
  def self.generate_random_password
    Digest::SHA1.hexdigest(Time.now.to_s)
  end  
  
  ###### Carrega relação com as engines <<NAO EDITAR>> #####
  Dir.glob("engines/*").each do |e| 
    if File.exists?("#{e}/lib/generators/templates/user")
      eval File.open("#{e}/lib/generators/templates/user", "rb").read
      eval "\n"
    end
  end
  
  def name_without_accents
    self.name.removeaccents
  end
  
  
end

