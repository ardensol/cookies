class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy, :finalize]

  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.all
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit

  end

  def finalize
    

  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)

  
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to finalize_path(@appointment) }
        format.json { render :show, status: :created, location: @appointment }
      else
        flash[:error] = "Sorry!  We Don't Deliver to that Area Yet!"
        format.html { redirect_to root_path }
       end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    
    @appointment.find_or_create_stripe_customer(appointment_params)

    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to '/confirmation'}
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:email, :address_line_1, :address_line_2, :city, :state, :zip, :phone_number, :coupon_code, :appointment_date, :card_token, :amount, :appointment_type, :deep_clean, :inside_fridge, :inside_oven, :inside_cabinets, :walls, :move_inout, :inside_windows)
    end
end
