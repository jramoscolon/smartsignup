class CreateRegistros < ActiveRecord::Migration
  def change
    create_table :registros do |t|
      t.string :nombre
      t.string :apellido
      t.string :puesto
      t.string :materia
      t.string :centro
      t.string :pueblo
      t.string :nivel
      t.string :sec
      t.string :email
      t.string :telefono
      t.text :comentario
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
