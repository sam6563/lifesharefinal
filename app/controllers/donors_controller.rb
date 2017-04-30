class DonorsController < ApplicationController
  before_action :set_donor, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  skip_before_filter :verify_authenticity_token, only: [:search]
  skip_before_filter :authenticate_user!, only: [:search]
  load_and_authorize_resource :except => [:search, :edit]
  # GET /donors
  # GET /donors.json
  def index
    @donors = Donor.all
  if params[:search]
    @donors = Donor.near(params[:loc], 20, :units => :km)
  else
    @donors = Donor.all.order('created_at DESC')
  end
end

  def search
    debugger
    @donor=Donor.near(params[:loc], 20, :units => :km).last(5)
    respond_to do |format|
      format.json {render json: @donor}
    end
  end


  # GET /donors/1
  # GET /donors/1.json
  def show

  end

  # GET /donors/new
  def new
     if user_signed_in? 
      if Donor.exists?(:user_id => current_user.id)
        @donor = Donor.where(:user_id => current_user.id)
        @d = @donor.first.id
        respond_to do |format|
        format.html {redirect_to "/donors/#{@d}/edit"}
        end
      else  
        @donor = Donor.new
      end
    end

  end

  # GET /donors/1/edit
  def edit
  end

  # POST /donors
  # POST /donors.json

  def create

    @donor = Donor.new(donor_params)

    respond_to do |format|
      if @donor.save
        format.html { redirect_to @donor, notice: 'Donor was successfully created.' }
        format.json { render :show, status: :created, location: @donor }
      else
        format.html { render :new }
        format.json { render json: @donor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /donors/1
  # PATCH/PUT /donors/1.json
  def update
    respond_to do |format|
      if @donor.update(donor_params)
        format.html { redirect_to @donor, notice: 'Donor was successfully updated.' }
        format.json { render :show, status: :ok, location: @donor }
      else
        format.html { render :edit }
        format.json { render json: @donor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donors/1
  # DELETE /donors/1.json
  def destroy
    @donor.destroy
    respond_to do |format|
      format.html { redirect_to donors_url, notice: 'Donor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donor
      @donor = Donor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donor_params
      params.require(:donor).permit(:name, :blood_group, :dob, :state, :city, :address, :latitude, :longitude, :last_blood_donated, :contact_number, :email_id, :user_id)
    end
end
