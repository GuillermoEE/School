class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  before_action :set_specialities, only: [:new, :edit, :create]

  # GET /requests
  # GET /requests.json
  def index

    authorize! :update , Request


    @requests = Request.all

    if params[:search]
    @requests = Request.search(params[:search]).order("created_at DESC")
    else
    @requests = Request.all.order('created_at DESC')
    end

=begin
    @confirm = Request.all
    @requests.each_with_index do |x,p|
      @confirm.each_with_index do |j,b|
        if p < b
          if x.name == j.name and x.apellidoPaterno == j.apellidoPaterno and x.apellidoMaterno == j.apellidoMaterno
            x.delete
          end
        end
      end

    end
=end

  end#index

  # GET /requests/1
  # GET /requests/1.json
  def show

    authorize! :show , Request
  end

  def delateAll
      authorize! :destroy , Request
      Request.destroy_all

  end

  # GET /requests/new
  def new
    authorize! :create , Request
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
    authorize! :edit , Request
  end

  # POST /requests
  # POST /requests.json
  def create
    authorize! :create , Request

    @request = Request.new(request_params)



    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update

    authorize! :update , Request

    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy

    authorize! :destroy , Request

    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import

    authorize! :update , Request

    Request.import(params[:file])
    redirect_to requests_url, notice: "la base de datos fue importada correctamente"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    def set_specialities
      @specialities = Array.new

      Speciality.all.each do |x|
        @specialities.push(x.name.upcase)
      end

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:name, :apellidoPaterno, :apellidoMaterno, :examMark, :schoolAverage, :isForeign, :speciality, :secondSpeciality)
    end
end
