class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
    #funcion index solo peude ser ejecutada por el rol admin en los usuarios
  def index?
    #owner del cursos
    @user.has_role?:admin
  end
  #funcion editar solo peude ser ejecutada por el rol admin en los usuarios
  def edit?
    #owner del cursos
    @user.has_role?:admin
  end
  
  #funcion update solo peude ser ejecutada por el rol admin en los usuarios
  def update?
    @user.has_role?:admin
  end
end
