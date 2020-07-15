class HomeController < ApplicationController
  #si el usuario no esta autenticado redirige al index home
  skip_before_action :authenticate_user!, :only => [:index]
  def index
    #se crea variable courses para el home index con todos los cursos
    @courses = Course.all.limit(3)
    #se crea variable para los ultimos 3 cursos creados por fecha
    @latest_courses = Course.all.limit(3).order(created_at: :desc)
  end
  #se define metodo que devuelce las actividades almacenadas
  def activity
    @activities = PublicActivity::Activity.all
  end
end
