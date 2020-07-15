class AddUsersToCourses < ActiveRecord::Migration[6.0]
  def change
    #se agrega relacion de llave foranea un usuario tiene muchos cursos
    add_reference :courses, :user, null: false, foreign_key: true
  end
end
