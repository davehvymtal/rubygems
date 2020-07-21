class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :devise, :confirmable

  rolify 
  
  def to_s
    email
  end
  
  def username
    self.email.split(/@/).first
  end
  has_many :courses
  
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
end
