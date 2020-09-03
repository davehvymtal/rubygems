class Enrollment < ApplicationRecord
  #-------Relaciones de la tabla users------------------------------------------
  #-------------------------------------------------------------------------------
  #se agrega relacion la tabla courses con has_many hace referencia de un usario tiene muchos cursos
  belongs_to :course
  #se agrega relacion la tabla courses con has_many hace referencia de un usario tiene muchos cursos
  belongs_to :user
  #-------------------------------------------------------------------------------
  #-------Validaciones de campos de la tabla enrrollment-------------------------------
  #se agregan validacion de obligatoriedad de course y user
  validates :user, :course,  presence: true
  #se agrega validacion donde un usuario no puede enrolarse mas de una vez a un curso
  validates_uniqueness_of :user_id, scope: :course_id
  validates_uniqueness_of :course_id, scope: :user_id
  #se agrega validacion donde el usuario creador del curno no puede enrolarse
  validate :cant_suscribe_to_own_course
  def to_s
    user.to_s + " " + course.to_s
  end
  protected
  def cant_suscribe_to_own_course 
    if self.new_record?
      if self.user_id.present?
        if user_id == course.user_id
          errors.add(:base, "you can not suscribe to your ouw course")
        end
      end
    end
  end
end
