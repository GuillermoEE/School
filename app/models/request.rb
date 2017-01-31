class Request < ApplicationRecord
  def self.import(file)
    CSV.foreach(file.path, headers: true, :encoding => 'utf-8') do |row|
      Request.create! row.to_hash
    end
  end

  validates :name, :apellidoPaterno, :apellidoMaterno, presence: { message: "El campo no puede estar en blanco"}
  validates :examMark, :schoolAverage, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10 }
  validate :validate_specialities


  private
    def validate_specialities
      if speciality == secondSpeciality
        errors.add(:speciality, "No se puede elegir la misma especialidad")
        errors.add(:secondSpeciality, "No se puede elegir la misma especialidad")
      end
    end

    def self.search(query)
    where("name like ?", "%#{query}%")
  end #sel.search


end#class
