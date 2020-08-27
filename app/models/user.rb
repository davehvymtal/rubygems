class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :devise, :confirmable

  rolify
  #-------Relaciones de la tabla users------------------------------------------
  #-------------------------------------------------------------------------------
  #se agrega relacion la tabla courses con has_many hace referencia de un usario tiene muchos cursos
  has_many :courses
  #se agrega relacion la tabla enrollments con has_many hace referencia de un usario tiene muchas enrolamientos
  has_many :enrollments
  #-------------------------------------------------------------------------------
  
  def to_s
    email
  end
  
  def username
    self.email.split(/@/).first
  end
  
  #se agrega asociacion del friendly ID es el campo emial de los usuarios
  extend FriendlyId
  friendly_id :email, use: :slugged
  
  #se agrega role por default
  after_create :assign_default_role
  #se asigna el rol studiante por default
  def assign_default_role
    #cuando se crea el primer usuario este tendria el rol de admin
    if User.count == 1
      self.add_role(:admin) if self.roles.blank?
      self.add_role(:teacher)
      self.add_role(:student)
    else
      #cuando se crean otros usuarios se agrega por defecto sudiante pero si hay rol se pone como teacher
       self.add_role(:student) if self.roles.blank?
      self.add_role(:teacher)
    end
  end
  
  #se agrega validacion de autorizacion police
  validate :must_have_a_role, on: :update
  
  #se crea el metodo online que valida si el campo update_at esta actualizado hace 2 minutos
  def online?
    updated_at > 2.minutes.ago
  end
  
  private
  #se agrega metodo que valida si el usuario tiene almenos un rol asignado
  def must_have_a_role
    unless roles.any?
      errors.add(:roles, "Must Have at least one role")
    end
  end
end
