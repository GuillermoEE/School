class CreateAllaccepteds < ActiveRecord::Migration[5.0]
  def change
    create_table :allaccepteds do |t|
      t.string :name #Nombre del alumno
      t.string :apellidoPaterno #apellido paterno
      t.string :apellidoMaterno #apellido matero
      t.decimal :examMark #Calificacion del examen
      t.decimal :schoolAverage #Calificacion de la secundaria
      t.boolean :isForeign # Foraneo
      t.string :speciality #Especialidad 1
      t.string :secondSpeciality #Especialidad 2
      t.timestamps
    end
  end
end
