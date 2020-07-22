class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  #funcion editar solo peude ser ejecutada por el rol admin en los cursos
  def edit?
    #owner del curso
    @user.has_role?:admin || @record.user = @user
  end
  
  #funcion editar solo peude ser ejecutada por el rol admin en los cursos
  def update?
    @user.has_role?:admin || @record.user = @user
  end
  
  #funcion new solo peude ser ejecutada por el rol teacher en los cursos
  def new?
    @user.has_role?:teacher
  end
  
  #funcion cfreate solo peude ser ejecutada por el rol teacher en los cursos
  def create?
    @user.has_role?:teacher
  end
  
  #funcion destroy solo peude ser ejecutada por el rol admin en los cursos
  def destroy?
    @user.has_role?:admin
  end
end
