class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  # GET /lessons
  # GET /lessons.json
  def index
    @lessons = Lesson.all
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
    #se agrega politica de acceso a la funcion
    authorize @lesson
  end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
    #se agrega declaracion del obejto curso segun el friendly id enviado por parametro
    @course = Course.friendly.find(params[:course_id])

  end

  # GET /lessons/1/edit
  def edit
    #se agrega politica de acceso a la funcion
    authorize @lesson
  end

  def create
    @lesson = Lesson.new(lesson_params)
    #se agrega declaracion del obejto curso segun el friendly id enviado por parametro
    @course = Course.friendly.find(params[:course_id])
    # se realiza asingacion del campo course_id
    @lesson.course_id = @course.id
    #se agrega politica de acceso a la funcion
    authorize @lesson
    respond_to do |format|
      if @lesson.save
        #cuando se crea una nueva leccion se redije al path nuevo de CURSOS/CURSO_FRIENDLYID donde se listan las lecciones
        format.html { redirect_to course_lesson_path(@course, @lesson), notice: 'Lesson was successfully created.' }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1
  # PATCH/PUT /lessons/1.json
  def update
    authorize @lesson
    respond_to do |format|
      if @lesson.update(lesson_params)
        #cuando se actualiza una leccion se redije al path nuevo de CURSOS/CURSO_FRIENDLYID donde se listan las lecciones
        format.html { redirect_to course_lesson_path(@course, @lesson), notice: 'Lesson was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    #se agrega politica de acceso a la funcion
    authorize @lesson

    @lesson.destroy
    respond_to do |format|
      #cuando se elimina una leccion se devuelve ap path del curso seleccionado
      format.html { redirect_to course_path(@course), notice: 'Lesson was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
        
      #se agrega declaracion del obejto curso segun el friendly id enviado por parametro
      @course = Course.friendly.find(params[:course_id])
      #se agrega friendly ID a la tabla lessons  
      @lesson = Lesson.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lesson_params
      params.require(:lesson).permit(:title, :content, :course_id)
    end
end
