class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [:show, :edit, :update, :destroy]
  before_action :set_course, only: [:new, :create]
  # GET /enrollments
  def index    
    @enrollments = Enrollment.all
    #Se agrega validacion de politicas para index
    authorize @enrollments
  end

  # GET /enrollments/1
  def show
  end

  # GET /enrollments/new
  def new
    #Se agrega validacion de politicas para new
    @enrollment = Enrollment.new
  end

  # GET /enrollments/1/edit
  def edit
    #Se agrega validacion de politicas para edit
    authorize @enrollment
  end

  # POST /enrollments
  def create
    
    if @course.price > 0
      flash[:alert] = "you can not acces paid courses yet"
      redirect_to new_course_enrollment_path(@course)
    else
      @enrollment = current_user.buy_course(@course)
      redirect_to course_path(@course), notice: "you are enrrolled!"
    end
  end

  # PATCH/PUT /enrollments/1
  def update
    #Se agrega validacion de politicas para update
    authorize @enrollment
    respond_to do |format|
      if @enrollment.update(enrollment_params)
        format.html { redirect_to @enrollment, notice: 'Enrollment was successfully updated.' }
        format.json { render :show, status: :ok, location: @enrollment }
      else
        format.html { render :edit }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrollments/1
  def destroy
    #Se agrega validacion de politicas para destroy
    authorize @enrollment
    @enrollment.destroy
    respond_to do |format|
      format.html { redirect_to enrollments_url, notice: 'Enrollment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
    def set_course
      @course = Course.friendly.find(params[:course_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enrollment_params
      #se elimina el campo :price de los parametros ya que se calcula apartir del valor del curso seleccionado, se eliminan cuando se compran:course_id, :user_id,
      params.require(:enrollment).permit( :rating, :review)
    end
end
