class UsersController < ApplicationController
  #si el usuario no esta autenticado redirige al index
  before_action :set_user, :only => [:edit, :update]
  def index
    #@users = User.all.order(created_at: :desc)
    #se agrega filtro de usuarios por parametros de la gema ransanck
    @q = User.ransack(params[:q])
    #en la varable users queda el resultado filtrado
    @users = @q.result(distinct: true)
  end
  #edicion sin funcionalidad
  def edit 
  end
  
  # funcion update
  def update
    if @user.update(user_params)
      redirect_to users_path, notice: 'User roles were successfully updated.'
    else
      render :edit
    end
  end
  
  private

  def set_user
    @user = User.find(params[:id])
  end
  
  #funcion de los parametros obligatorios de usuarios
  def user_params
    params.require(:user).permit({role_ids: []})
  end

end
