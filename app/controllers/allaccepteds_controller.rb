class AllacceptedsController < ApplicationController
  before_action :set_accepted, only: [:show, :edit, :update, :destroy]


  # GET /accepteds
  # GET /accepteds.json
  def index
    @allAccepteds = Allaccepted.all
  end

  # GET /accepteds/1
  # GET /accepteds/1.json
  def show
  end

  # GET /accepteds/new
  def new
    @allAccepted = Allaccepted.new
  end

  # GET /accepteds/1/edit
  def edit
  end

  # POST /accepteds
  # POST /accepteds.json
  def create
    @allAccepted = Allaccepted.new(accepted_params)

    respond_to do |format|
      if @allAccepted.save
        format.html { redirect_to @aallAccepted, notice: 'Accepted was successfully created.' }
        format.json { render :show, status: :created, location: @allAaccepted }
      else
        format.html { render :new }
        format.json { render json: @allAaccepted.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accepteds/1
  # PATCH/PUT /accepteds/1.json
  def update
    respond_to do |format|
      if @allAaccepted.update(accepted_params)
        format.html { redirect_to @allAaccepted, notice: 'Accepted was successfully updated.' }
        format.json { render :show, status: :ok, location: @allAaccepted }
      else
        format.html { render :edit }
        format.json { render json: @allAaccepted.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accepteds/1
  # DELETE /accepteds/1.json
  def destroy
    @allAccepted.destroy
    respond_to do |format|
      format.html { redirect_to accepteds_url, notice: 'Accepted was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accepted
      @allAccepted = Allaccepted.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accepted_params
      params.require(:accepted).permit(:name, :apellidoPaterno, :apellidoMaterno, :examMark, :schoolAverage, :speciality, :secondSpeciality, :finalSpeciality, :turn, :group)
    end
end
