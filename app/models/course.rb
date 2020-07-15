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
end
