class Accepted < ApplicationRecord
  validates :name, :apellidoPaterno, :apellidoMaterno, presence: { message: "El campo no puede estar en blanco"}
end
