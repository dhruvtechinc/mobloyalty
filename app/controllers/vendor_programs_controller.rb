class VendorProgramsController < ApplicationController
  before_action :set_vendor_program, only: [:show, :edit, :update, :destroy]

  # GET /vendor_programs
  # GET /vendor_programs.json
  def index
    @vendor_programs = VendorProgram.all
  end

  # GET /vendor_programs/1
  # GET /vendor_programs/1.json
  def show
  end

  # GET /vendor_programs/new
  def new
    @vendor_program = VendorProgram.new
  end

  # GET /vendor_programs/1/edit
  def edit
  end

  # POST /vendor_programs
  # POST /vendor_programs.json
  def create
    @vendor_program = VendorProgram.new(vendor_program_params)

    respond_to do |format|
      if @vendor_program.save
        format.html { redirect_to @vendor_program, notice: 'Vendor program was successfully created.' }
        format.json { render action: 'show', status: :created, location: @vendor_program }
      else
        format.html { render action: 'new' }
        format.json { render json: @vendor_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendor_programs/1
  # PATCH/PUT /vendor_programs/1.json
  def update
    respond_to do |format|
      if @vendor_program.update(vendor_program_params)
        format.html { redirect_to @vendor_program, notice: 'Vendor program was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vendor_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendor_programs/1
  # DELETE /vendor_programs/1.json
  def destroy
    @vendor_program.destroy
    respond_to do |format|
      format.html { redirect_to vendor_programs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor_program
      @vendor_program = VendorProgram.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vendor_program_params
      params.require(:vendor_program).permit(:type_code, :type_desc)
    end
end
