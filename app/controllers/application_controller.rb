class ApplicationController < ActionController::Base
 #se agrega validacion de autenticacion de usuarios en el controlador de la aplicacion
  before_action :authenticate_user!
  
  before_action :set_global_variables, if: :user_signed_in?
  def set_global_variables
    #se agrega filtro ransack para el index home por medio de cursos.
    @ransack_courses = Course.ransack(params[:courses_search], search_key: :courses_search) #navbar search
  end
end
