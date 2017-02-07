class CreateAccepteds < ActiveRecord::Migration[5.0]
  def change
    create_table :accepteds do |t|
      t.string :name
      t.string :apellidoPaterno
      t.string :apellidoMaterno
      t.decimal :examMark
      t.decimal :schoolAverage
      t.string :speciality
      t.string :secondSpeciality
      t.string :finalSpeciality
      t.string :turn
      t.string :group

      t.timestamps
    end
  end
end
