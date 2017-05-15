class Speciality < ApplicationRecord
  validates :name, :numberStudents,  presence: { message: "El campo no puede estar en blanco"}
  validates :morningClasses, presence: {message: "Si no quieres salones en la mañana pon 0"}
  validates :eveningClasses, presence: {message: "Si no quieres salones en la tarde pon 0"}
  validates :eveningClasses, :morningClasses, :numberStudents, numericality: { only_integer: true, message: "Solo numeros"}
end
