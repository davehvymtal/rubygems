class AddTrackableToDevise < ActiveRecord::Migration[6.0]
  def change
    #se agrega gem trackable donde se agregan las siguientes columnas al la tabla de users.
    add_column :users, :sign_in_count, :integer, default: 0, null: false
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :last_sign_in_at, :datetime
    add_column :users, :current_sign_in_ip, :inet
    add_column :users, :last_sign_in_ip, :inet
  end
end
