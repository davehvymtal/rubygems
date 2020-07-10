class Course < ApplicationRecord
  #se agregan validacion de los campos sean obligatorios
  validates :title,  presence: true
  #se valida que el campo descipcion tenga mas de 5 caracteres
  validates :description, presence: true, length: { :minimum => 5 }
  def to_s
  title
  end
  #se asocia que el richtext es para description
  has_rich_text :description
end
