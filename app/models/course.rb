class Course < ApplicationRecord
  #se agregan validacion de los campos sean obligatorios
  validates :title, :short_description, :language, :price, :level,  presence: true
  #se valida que el campo descipcion tenga mas de 5 caracteres
  validates :description, presence: true, length: { :minimum => 5 }
  #se agrega relacion con la tabla usuarios
  belongs_to:user
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
end
