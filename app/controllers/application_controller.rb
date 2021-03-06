class ApplicationController < ActionController::Base
 #se agrega validacion de autenticacion de usuarios en el controlador de la aplicacion
  before_action :authenticate_user!
  #se crea variable donde estara el user activity
  #after_action :user_activity
  
  after_action :user_activity, if: :user_signed_in?
  
  include Pagy::Backend

  #se agrega referencia gem pundit
  include Pundit
  #se agrega mensaje de error generico
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

   #esta linea de codigo permite saber cual es el usurio que realiza la accion
  include PublicActivity::StoreController

  before_action :set_global_variables
  #before_action :set_global_variables, if: :user_signed_in?
  def set_global_variables
    #se agrega filtro ransack para el index home por medio de cursos.
    @ransack_courses = Course.ransack(params[:courses_search], search_key: :courses_search) #navbar search
  end

  private
  #se crea metodo que devuelve el valor de touch del usuario
  def user_activity
   current_user.try :touch
  end
  
 #se agrega metodo de usuario no autorizado con mensaje personalizado
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

end
