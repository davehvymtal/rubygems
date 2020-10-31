# == Schema Information
#
# Table name: courses
#
#  id                :bigint           not null, primary key
#  title             :string
#  description       :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :bigint           not null
#  slug              :string
#  short_description :text
#  language          :string           default("English"), not null
#  level             :string           default("Beginner"), not null
#  price             :integer          default(0), not null
#
class Course < ApplicationRecord
  #-------Validaciones de campos de la tabla course-------------------------------
  #se agregan validacion de los campos sean obligatorios
  validates :title, :short_description, :language, :price, :level,  presence: true
  #se valida que el campo descipcion tenga mas de 5 caracteres
  validates :description, presence: true, length: { :minimum => 5 }
  #-------------------------------------------------------------------------------
  
  #-------Relaciones de la tabla courses------------------------------------------
  #se agrega relacion con la tabla usuarios belongs_to hace referncia a que un curso tiene un solo usuario de creacion
  belongs_to:user
  #se agrega relacion la tabla lessons con has_many hace referencia de un curso tiene muchas lecciones
  has_many :lessons, dependent: :destroy
  #-------------------------------------------------------------------------------
  #se agrega relacion la tabla enrollments con has_many hace referencia de un curso tiene muchas enrolamientos
  has_many :enrollments
  #-------------------------------------------------------------------------------
  
  
  def to_s
  title
  end
  
  #se asocia que el richtext es para description
  has_rich_text :description
  
  #se agrega asociacion del friendly ID es el campo titulo de los cursos
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  #Se agregan vectores con constantes para listas desplegables, lenguaje y los niveles.
  LANGUAGES = [:"English", :"Russian", :"Polish", :"Spanish"]
  def self.languages
    LANGUAGES.map { |language| [language, language] }
  end

  LEVELS = [:"All levels", :"Beginner", :"Intermediate", :"Advanced"]
  def self.levels
    LEVELS.map { |level| [level, level] }
  end
  
  #se agregan lineas de configuracion del modelo activity
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user}
  
  def bougth(user)
    #se realiza validacion si el usuario tiene enrolamiento = false
    self.enrollments.where(user_id: [user.id], course_id: [self.id]).empty?
  end
end
