class LessonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  #funcion show solo peude ser ejecutada por el id del usuario que creo la leccion o por el rol admin o si el usuario esta enrrolado en el curso
  def show?
    @user.has_role?(:admin)|| @record.course.user_id == @user.id ||  @record.course.bougth(@user) == false
  end
  
  #funcion edit solo peude ser ejecutada por el id del usuario que creo la leccion
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
  
    #solo el creador del curso puede agregar lecciones
  def destroy?
    @record.course.user_id == @user.id
  end
end
