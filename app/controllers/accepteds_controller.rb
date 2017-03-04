class AcceptedsController < ApplicationController
  before_action :set_accepted, only: [:show, :edit, :update, :destroy]


  # GET /accepteds
  # GET /accepteds.json
  def index
      authorize! :update , Accepted
    @accepteds = Accepted.all

    #buscador en la zona de grupos
  if params[:search]
    @sgroups = Accepted.search(params[:search]).order("created_at DESC")
  else
    @sgroups = Accepted.all.order('created_at DESC')
  end


#para  exportar en .csv
@export = Accepted.order(:finalSpeciality)
   respond_to do |format|
     format.html
     format.csv { send_data @export.to_csv }
   end

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
  end

  # GET /accepteds/1
  # GET /accepteds/1.json
  def show
      authorize! :show , Accepted
  end

  # GET /accepteds/new
  def new
      authorize! :create , Accepted
    @accepted = Accepted.new
  end

  # GET /accepteds/1/edit
  def edit
      authorize! :edit , Accepted
  end

  def delateAll1
      authorize! :destroy , Accepted
      #Request.destroy_all
      Allaccepted.destroy_all
      Accepted.destroy_all
      #Speciality.destroy_all
      redirect_to "/grupos"
  end
  # POST /accepteds
  # POST /accepteds.json
  def create
        authorize! :create , Accepted
    @accepted = Accepted.new(accepted_params)

    respond_to do |format|
      if @accepted.save
        format.html { redirect_to @accepted, notice: 'Accepted was successfully created.' }
        format.json { render :show, status: :created, location: @accepted }
      else
        format.html { render :new }
        format.json { render json: @accepted.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accepteds/1
  # PATCH/PUT /accepteds/1.json
  def update
      authorize! :destroy , Accepted
    respond_to do |format|
      if @accepted.update(accepted_params)
        format.html { redirect_to @accepted, notice: 'Accepted was successfully updated.' }
        format.json { render :show, status: :ok, location: @accepted }
      else
        format.html { render :edit }
        format.json { render json: @accepted.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accepteds/1
  # DELETE /accepteds/1.json
  def destroy
      authorize! :destroy , Accepted
      authorize! :manage , Request
    @accepted.destroy
    respond_to do |format|
      format.html { redirect_to accepteds_url, notice: 'Accepted was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accepted
      @accepted = Accepted.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accepted_params
      params.require(:accepted).permit(:name, :apellidoPaterno, :apellidoMaterno, :examMark, :schoolAverage, :speciality, :secondSpeciality, :finalSpeciality, :turn, :group)
    end
end
