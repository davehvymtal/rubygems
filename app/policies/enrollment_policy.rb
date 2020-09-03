class EnrollmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
    #funcion show solo peude ser ejecutada por el rol admin
  def index?
    @user.has_role?(:admin)
  end
  
  #funcion editar solo peude ser ejecutada por el id del usuario que creo el enrolamiento
  def edit?
    #owner del curso
     @record.user_id == @user.id
  end
  
  #funcion update solo peude ser ejecutada por el id del usuario que creo el enrolamiento
  def update?
    @record.user_id == @user.id  
  end
  
    #funcion show solo peude ser ejecutada por el rol admin
  def destroy?
    @user.has_role?(:admin)
  end
end
