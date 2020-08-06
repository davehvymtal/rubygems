class LessonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  #funcion show solo peude ser ejecutada por el id del usuario que creo la leccion o por el rol admin
  def show?
    @user.has_role?(:admin)|| @record.course.user_id == @user.id
  end
  
  #funcion editar solo peude ser ejecutada por el id del usuario que creo la leccion
  def edit?
    #owner del curso
     @record.course.user_id == @user.id
  end
  
  #funcion update solo peude ser ejecutada por el id del usuario que creo la leccion
  def update?
    @record.course.user_id == @user.id  end
  
  def new?
    
  end
  
  def create?
    #solo el creador del curso puede agregar lecciones
    @record.course.user_id == @user.id

  end
  
  #funcion destroy solo peude ser ejecutada por el id del usuario que creo la leccion
  def destroy?
    @record.course.user_id == @user.id
  end
end
