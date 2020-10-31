# == Schema Information
#
# Table name: lessons
#
#  id         :bigint           not null, primary key
#  title      :string
#  content    :text
#  course_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#
class Lesson < ApplicationRecord
  #-------Relaciones de la tabla courses------------------------------------------
  #hace referencia que la tabla lessons tiene un solo curso asociado
  belongs_to :course
  #-------------------------------------------------------------------------------

  #-------Validaciones de campos de la tabla course-------------------------------
  # se hace validacion para que los campos titulo, content, y course sean obligatorios
  validates :title, :content, :course, presence: true
  #-------------------------------------------------------------------------------

  #se asocia que el richtext es para content
  has_rich_text :content
  
  #se agrega asociacion del friendly ID es el campo titulo de las lecciones
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  #se agregan lineas de configuracion del modelo activity
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  def to_s
    title
  end
end
