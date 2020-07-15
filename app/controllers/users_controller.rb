class UsersController < ApplicationController
  #si el usuario no esta autenticado redirige al index
  skip_before_action :authenticate_user!, :only => [:index]
  def index
    #@users = User.all.order(created_at: :desc)
    #se agrega filtro de usuarios por parametros de la gema ransanck
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end
end
