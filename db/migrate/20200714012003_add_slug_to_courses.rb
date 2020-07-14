class AddSlugToCourses < ActiveRecord::Migration[6.0]
  def change
    #se agrega GEM frendly-ID la cual agrega a una columna un index y llave primaria
    add_column :courses, :slug, :string
    add_index :courses, :slug, unique: true
  end
end
