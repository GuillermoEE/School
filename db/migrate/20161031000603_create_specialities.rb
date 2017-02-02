class CreateSpecialities < ActiveRecord::Migration[5.0]
  def change
    create_table :specialities do |t|
      t.string :name # Nombre de la especialidad
      t.boolean :morningTurn #turno de la mañana
      t.boolean :eveningTurn #Turno de la tarde
      t.integer :morningClasses #numero de salones en la mañana
      t.integer :eveningClasses #numero de salones en la tarde
      t.integer :numberStudents #Total de estudiantes en la especialidad

      t.timestamps
    end
  end
end
