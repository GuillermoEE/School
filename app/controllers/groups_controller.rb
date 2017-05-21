class GroupsController < ApplicationController



def index
    authorize! :manage , Request
end

  def generate
      authorize! :manage , Request

    # $accepted inidica el numero total de alumnos que seran aceptados en esa generacion
    $acceptedLimit = 0

    # $specLimits indica el limite por cada especialidad
    $specLimits = Hash.new

    # $turnLimits indica el limite por cada turno dependiendo la especialidad
    $turnLimitsM = Hash.new
    #
    $turnLimitsV = Hash.new
    # $whichTurn indica que turnos tiene cierta especialidad
    $whichTurn = Hash.new

    # $insideSpec indica cuantos alumnos existen dentro de la especialidad actualmente
    $insideSpec = Hash.new

    # $insideTurn indica cuantos alumnos existen dentro del turno
    $insideTurnM = Hash.new

    # $insideTurn indica cuantos alumnos existen dentro del turno
    $insideTurnV = Hash.new



      Speciality.all.each do |s|
          limit = (s.morningClasses + s.eveningClasses)*s.numberStudents
          $acceptedLimit += limit
      end


      Speciality.all.each do |s|
        #Calculamos los limites
        limit = (s.morningClasses + s.eveningClasses)*s.numberStudents
        mTurnLimit = s.morningClasses * s.numberStudents
        vTurnLimit = s.eveningClasses * s.numberStudents
        #Calculamos turnos
        mTurn = s.morningTurn
        vTurn = s.eveningTurn



        $specLimits[s.name] = limit

        $turnLimitsM[s.name] = mTurnLimit

        $turnLimitsV[s.name] = vTurnLimit

        $whichTurn[s.name] = {"matutino" => mTurn, "vespertino" => vTurn}

        $insideSpec[s.name] = 0

        $insideTurnM[s.name] = 0

        $insideTurnV[s.name] = 0


      end


    @allAccepted1 = Request.all.order("examMark DESC , schoolAverage DESC").limit($acceptedLimit)
    @allAccepted2 = Array.new
    @limit1 = Array.new
    @limit2 = Array.new
    @resto = Array.new
    @accepted = Array.new
    @accepted2 = Array.new
    @accepted3 = Array.new
    @resto = Array.new
    @restoSave = Array.new
    @ABC= ['caca','A', 'B', 'C', 'D', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']

    @allAccepted1.each do |r|
      @allAccepted2.push(Allaccepted.new({
          :name => r.name,
          :apellidoPaterno => r.apellidoPaterno,
          :apellidoMaterno => r.apellidoMaterno,
          :examMark => r.examMark,
          :schoolAverage => r.schoolAverage,
          :speciality => r.speciality,
          :secondSpeciality => r.secondSpeciality
        }))
      end#allAccepted1

      if Allaccepted.all.length < 1
        @allAccepted2.each do |x|
          x.save
        end#allAccepted2
    end#if




    Speciality.all.each do |x|

      @ready1 = Allaccepted.where(speciality: x.name).limit(x.numberStudents * (x.morningClasses + x.eveningClasses))
      @ready2 = Allaccepted.where(secondSpeciality: x.name)
      @limit1.push((x.numberStudents * (x.morningClasses + x.eveningClasses)) - @ready1.all.where(speciality: x.name).length)

            @ready1.each do |r|
              @accepted.push(Accepted.new({
                  :name => r.name,
                  :apellidoPaterno => r.apellidoPaterno,
                  :apellidoMaterno => r.apellidoMaterno,
                  :examMark => r.examMark,
                  :schoolAverage => r.schoolAverage,
                  :turn => "null",
                  :speciality => r.speciality,
                  :secondSpeciality => r.secondSpeciality,
                  :finalSpeciality  => x.name,
                  :group => "null"
                }))
              end#accepted

              @ready2.each do |r|
                @accepted2.push(Accepted.new({
                    :name => r.name,
                    :apellidoPaterno => r.apellidoPaterno,
                    :apellidoMaterno => r.apellidoMaterno,
                    :examMark => r.examMark,
                    :schoolAverage => r.schoolAverage,
                    :turn => "null",
                    :speciality => r.speciality,
                    :secondSpeciality => r.secondSpeciality,
                    :finalSpeciality  => x.name,
                    :group => "null"
                  }))
                end#accepted

    end#Speciality


    @accepted.each do |o|
      @accepted2.each do |j|
        if o.name == j.name and o.apellidoPaterno == j.apellidoPaterno and o.apellidoMaterno == j.apellidoMaterno
          j.name = "modificado"
        end#if
      end#accepted2
    end#accepted

    Speciality.all.each do |x|
      @accepted2.each do |o|
        if x.name == o.secondSpeciality and o.name != "modificado"
          @accepted.push(o)
        end
      end
    end

      Speciality.all.each do |x|
        @accepted.each do |o|
          if $insideSpec[x.name] < $specLimits[x.name] and x.name == o.finalSpeciality
            @accepted3.push(o)
            $insideSpec[x.name] += 1
          end
        end
      end#Speciality

      @i = 0
      @accepted3.each do |x|
        @i += 1
        x.id = @i
      end

    @i = 0
    Speciality.all.each do |o|
      @accepted3.each do |x|
        @i += 1
        if @i % 2 == 0 and $insideTurnM[o.name] < $turnLimitsM[o.name] and x.finalSpeciality == o.name and o.morningTurn == true or $insideTurnV[o.name] == $turnLimitsV[o.name] and  x.finalSpeciality == o.name
          $insideTurnM[o.name] += 1
          if x.turn == "null"
            x.turn = "M"
          end
        elsif $insideTurnV[o.name] < $turnLimitsV[o.name] and x.finalSpeciality == o.name and o.eveningTurn == true or $insideTurnM[o.name] == $turnLimitsM[o.name] and  x.finalSpeciality == o.name
          $insideTurnV[o.name] += 1
          if x.turn == "null"
            x.turn = "V"
          end
        elsif o.eveningTurn == true and  o.morningTurn == false  and x.finalSpeciality == o.name
          x.turn = "V"
        elsif o.eveningTurn == false and o.morningTurn == true and  x.finalSpeciality == o.name
          x.turn = "M"
        end
      end#accepted3
    end#Speciality


    @i = 0
    @j = 0
    @letraM
    @letraV
    Speciality.all.each do |x|
      @m = x.morningClasses
      @v = x.eveningClasses
    @accepted3.each do |o|
      if o.turn == "M" and o.finalSpeciality == x.name
        @i += 1

        if @i > @m
          @i = 1
        end

        o.group = @ABC[@i]

        if @i == @m
          @i = 0
        end#if
      end#if
      if o.turn == "V" and o.finalSpeciality == x.name
        @j += 1

        if @j > @v
          @j = 1
        end

        o.group = @ABC[@j]

        if @j == @v
          @j = 0
        end#if

      end#if
    end#accepted3
  end#Speciality

    @accepted.each do |o|
      @accepted3.each do |j|
        if o.name == j.name and o.apellidoPaterno == j.apellidoPaterno and o.apellidoMaterno == j.apellidoMaterno
          o.speciality = "listo"
        end#if
      end#accepted2
    end#accepted

    @accepted.each do |x|
        if x.speciality != "listo"
          @resto.push(x)
      end
    end

    @resto.each do |x|
      x.finalSpeciality = "null"
    end

    @resto.each do |r|
      @restoSave.push(Accepted.new({
          :name => r.name,
          :apellidoPaterno => r.apellidoPaterno,
          :apellidoMaterno => r.apellidoMaterno,
          :examMark => r.examMark,
          :schoolAverage => r.schoolAverage,
          :turn => "null",
          :speciality => r.speciality,
          :secondSpeciality => r.secondSpeciality,
          :finalSpeciality  => "null",
          :group => "null"
        }))
      end#accepted


    if Accepted.all.length < 1
      @accepted3.each do |x|
        x.save
      end#accepted
      @restoSave.each do |o|
        o.save
      end
  end#if




  redirect_to "/grupos"

  end#generate


end#class
