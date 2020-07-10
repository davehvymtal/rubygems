class ApplicationController < ActionController::Base
 #se agrega validacion de autenticacion de usuarios en el controlador de la aplicacion
  before_action :authenticate_user!
end
