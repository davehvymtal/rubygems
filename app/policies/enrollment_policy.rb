class EnrollmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
    #funcion show solo peude ser ejecutada por el id del usuario que creo la leccion o por el rol admin
  def index?
    @user.has_role?(:admin)
  end
  
  #funcion editar solo peude ser ejecutada por el id del usuario que creo la leccion
  def edit?
    #owner del curso
     @record.user_id == @user.id
  end
  
  #funcion update solo peude ser ejecutada por el id del usuario que creo la leccion
  def update?
    @record.|user_id == @user.id  
  end
  
  #funcion destroy solo peude ser ejecutada por el id del usuario que creo la leccion
  def destroy?
    @user.has_role?(:admin)
  end
end
