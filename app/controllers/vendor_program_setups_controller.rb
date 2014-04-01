class VendorProgramSetupsController < ApplicationController
  before_action :signed_in_user
  before_action :set_my_store, only: [:test, :create, :update]
  before_action :set_vendor_program_setup, only: [:test, :show, :edit, :update, :destroy]

  # GET /vendor_program_setups
  # GET /vendor_program_setups.json
  def index
    @vendor_program_setups = VendorProgramSetup.all
  end
  def test
      @vendor_program_setup = @vendor_program_setup.nil? ? VendorProgramSetup.new : @vendor_program_setup
      @vendor_program_setup_nc = @vendor_program_setup_nc.nil? ? VendorProgramSetup.new : @vendor_program_setup_nc
      #@vendor_program_setup_bp = @vendor_program_setup_bp.nil? ? VendorProgramSetup.new : @vendor_program_setup_bp
      @vendor_program_setup_pc = @vendor_program_setup_pc.nil? ? VendorProgramSetup.new : @vendor_program_setup_pc
  end

  # GET /vendor_program_setups/1
  # GET /vendor_program_setups/1.json
  def show
  end

  # GET /vendor_program_setups/new
  def new
    @vendor_program_setup = VendorProgramSetup.new
  end

  # GET /vendor_program_setups/1/edit
  def edit
  end

  # POST /vendor_program_setups
  # POST /vendor_program_setups.json
  def create
      params[:vendor_program_setup][:stores_id] = @store.id
      puts params[:vendor_program_setup][:stores_id]
    if params[:daily_points_setup]
      @vendor_program_setup = VendorProgramSetup.new(vendor_program_setup_params)
      respond_to do |format|
        if @vendor_program_setup.save
          format.html { redirect_to @vendor_program_setup, notice: 'Vendor program setup was successfully created.' }
          format.json { render action: 'show', status: :created, location: @vendor_program_setup }
        else
          format.html { render action: 'new' }
          format.json { render json: @vendor_program_setup.errors, status: :unprocessable_entity }
        end
      end
    end
=begin
    if params[:bonus_points_setup]
      @vendor_program_setup_bp = VendorProgramSetup.new(vendor_program_setup_params)
      respond_to do |format|
        if @vendor_program_setup_bp.save
          format.html { redirect_to @vendor_program_setup_bp, notice: 'Vendor program setup was successfully created.' }
          format.json { render action: 'show', status: :created, location: @vendor_program_setup_bp }
        else
          format.html { render action: 'new' }
          format.json { render json: @vendor_program_setup_bp.errors, status: :unprocessable_entity }
        end
      end
    end
=end
    if params[:punch_card_setup]
      @vendor_program_setup_pc = VendorProgramSetup.new(vendor_program_setup_params)
      respond_to do |format|
        if @vendor_program_setup_pc.save
          format.html { redirect_to @vendor_program_setup_pc, notice: 'Vendor program setup was successfully created.' }
          format.json { render action: 'show', status: :created, location: @vendor_program_setup_pc }
        else
          format.html { render action: 'new' }
          format.json { render json: @vendor_program_setup_pc.errors, status: :unprocessable_entity }
        end
      end
    end
    if params[:new_customer_setup]
      @vendor_program_setup_nc = VendorProgramSetup.new(vendor_program_setup_params)
      respond_to do |format|
        if @vendor_program_setup_nc.save
          format.html { redirect_to @vendor_program_setup_nc, notice: 'Vendor program setup was successfully created.' }
          format.json { render action: 'show', status: :created, location: @vendor_program_setup_nc }
        else
          format.html { render action: 'new' }
          format.json { render json: @vendor_program_setup_nc.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /vendor_program_setups/1
  # PATCH/PUT /vendor_program_setups/1.json
  def update
    respond_to do |format|
      if @vendor_program_setup.update(vendor_program_setup_params)
        format.html { redirect_to @vendor_program_setup, notice: 'Vendor program setup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vendor_program_setup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendor_program_setups/1
  # DELETE /vendor_program_setups/1.json
  def destroy
    @vendor_program_setup.destroy
    respond_to do |format|
      format.html { redirect_to vendor_program_setups_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor_program_setup
      #@vendor_program_setup = VendorProgramSetup.find(params[:id])
      @vendor_program_setup = VendorProgramSetup.where(:stores_id => @store.id, :vendor_programs_id => daily_rewards).first
      @vendor_program_setup_nc = VendorProgramSetup.where(:stores_id => @store.id, :vendor_programs_id => new_customer_rewards).first
      #@vendor_program_setup_bp = VendorProgramSetup.where(:stores_id => @store.id, :vendor_programs_id => 3).first
      @vendor_program_setup_pc = VendorProgramSetup.where(:stores_id => @store.id, :vendor_programs_id => punch_card_rewards).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vendor_program_setup_params
      params.require(:vendor_program_setup).permit(:stores_id, :vendor_programs_id, :accrue_points_visits, :reward_points_visits, :reward_type_desc, :start_date, :end_date)
    end
end

  def set_my_store
    @store = current_user.stores.first
  end