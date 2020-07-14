class UsersController < ApplicationController
  #si el usuario no esta autenticado redirige al index
  skip_before_action :authenticate_user!, :only => [:index]
  def index
    #se crea variable courses para el home index con todos los cursos
    @users = User.all.order(created_at: :desc)
  end
end
