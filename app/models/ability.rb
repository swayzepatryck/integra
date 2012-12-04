
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)    
    
    if user.admin?
      can :manage, :all
    else
      if user.has_role?(:integra_user_manager)  
        can :manage, User
      elsif user.has_role?(:integra_user_viewer)
        can :read, User
      else
        can :update, User, :id => user.id
      end    
    end
    
    ###### Carrega autorizacoes das engines <<NÃO EDITAR>> #####
    Dir.glob("engines/*").each do |e| 
      if File.exists?("#{e}/lib/generators/templates/ability")
        puts "#{e}/lib/generators/templates/ability"
        eval File.open("#{e}/lib/generators/templates/ability", "rb").read
        eval "\n"
      end
    end
        
    # Define abilities for the passed in user here. For example:
    #
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end

