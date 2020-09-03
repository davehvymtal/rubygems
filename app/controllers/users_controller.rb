class UsersController < ApplicationController
  #si el usuario no esta autenticado redirige al index
  #despues de asingar el usuario unicamente puede ejecutar las siguientes funciones
  before_action :set_user, :only => [:show, :edit, :update]
  
  def index
    #@users = User.all.order(created_at: :desc)
    #se agrega filtro de usuarios por parametros de la gema ransanck
    @q = User.ransack(params[:q])
    #en la varable users queda el resultado filtrado
    @users = @q.result(distinct: true)
    #se agrega validacion de politicas para index
    authorize @users
  end
  
  def show
  end
  
  #edicion sin funcionalidad
  def edit 
    #se agrega validacion de politicas para edit
    authorize @user
  end

  def update
    #se agrega validacion de politicas para update
    authorize @user
    if @user.update(user_params)
      redirect_to users_path, notice: 'User roles were successfully updated.'
    else
      render :edit
    end
  end
  
  private
  
  #se modifica funcionalidad se consulta el ID por el frendly id email
  def set_user
    @user = User.friendly.find(params[:id])
  end
  
  #funcion de los parametros obligatorios de usuarios
  def user_params
    params.require(:user).permit({role_ids: []})
  end

end
