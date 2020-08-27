class CoursesController < ApplicationController
  #si el usuario no esta autenticado redirige al index
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  
  # GET /courses
  # GET /courses.json
 #def index
  #  @courses = Course.all
  #end
  def index
    #if params[:title]
    #  @courses = Course.where('title ILIKE ?', "%#{params[:title]}%") #case-insensitive
    #else
      #@courses = Course.all .all funciona para obtener todos los registros de la tabla courses
      #Se agrega consulta y filtros ransack
      #@q = Course.ransack(params[:q])
      #@courses = @q.result.includes(:user)#(distinct: true)
    #end
    #- if current_user.has_role?(:admin)
        #se agrega ransack de cursos para los filtros por medio del search bar del hearder. se envia path
        @ransack_courses = Course.ransack(params[:courses_search], search_key: :courses_search) #navbar search
        #@courses = @ransack_courses.result.includes(:user)
        @pagy, @courses = pagy(@ransack_courses.result.includes(:user))

    #  else
    #    redirect_to root_path, alert:'You dont hace access'
    #end
      
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    #se crea variable de lessons donde estan las lecciones de los cursos
    @lessons = @course.lessons
  end

  # GET /courses/new
  def new
    @course = Course.new
    #se agrega validacion de autorizacion police
    authorize @course
  end

  # GET /courses/1/edit
  def edit
    #se agrega validacion de autorizacion police
    authorize @course
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    #se agrega validacion de autorizacion police
    authorize @course
    @course.user = current_user
    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    #se agrega validacion de autorizacion police
    authorize @course
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    #se agrega validacion de autorizacion police
    authorize @course
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      #se agrega consulta por friendly ID gema
      @course = Course.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    #se agregan las nuevas columnas de la tabla course :short_description, :price, :language, :level
    def course_params
      params.require(:course).permit(:title, :description, :short_description, :price, :language, :level)
    end
end
