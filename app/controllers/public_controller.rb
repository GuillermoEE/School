class PublicController < ApplicationController

  def index
  end

  def admisiones

    #Este array contiene todos los posibles grupos
    @groups = Array.new
    #Este array identifica al grupo con una letra en vez de un número
    @groupIdentifier = ['nill', 'A', 'B', 'C', 'D', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']

    #Calculamos todos los grupos posibles
    Speciality.all.each do |s|
      #Grupos de la mañana
      if s.morningTurn
        for i in (1..s.morningClasses)
          @groups.push(Hash.new({:speciality => s.name, :turn => 'M' , :group => i }))
        end #for Classes
      end #if else
      #Grupos de la tarde
      if s.eveningTurn
        for i in (1..s.eveningClasses)
          @groups.push(Hash.new({:speciality => s.name, :turn => 'V' , :group => i }))
        end #for Classes
      end #if else

    end #Speciality.each

  end#admisiones


end
