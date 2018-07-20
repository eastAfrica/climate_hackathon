class ForecastHoursController < ApplicationController
  before_action :set_forecast_hour, only: [:show, :edit, :update, :destroy]

  # GET /forecast_hours
  # GET /forecast_hours.json
  def index
    @forecast_hours = ForecastHour.all
  end

  # GET /forecast_hours/1
  # GET /forecast_hours/1.json
  def show
  end

  # GET /forecast_hours/new
  def new
    @forecast_hour = ForecastHour.new
  end

  # GET /forecast_hours/1/edit
  def edit
  end

  # POST /forecast_hours
  # POST /forecast_hours.json
  def create
    @forecast_hour = ForecastHour.new(forecast_hour_params)

    respond_to do |format|
      if @forecast_hour.save
        format.html { redirect_to @forecast_hour, notice: 'Forecast hour was successfully created.' }
        format.json { render :show, status: :created, location: @forecast_hour }
      else
        format.html { render :new }
        format.json { render json: @forecast_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forecast_hours/1
  # PATCH/PUT /forecast_hours/1.json
  def update
    respond_to do |format|
      if @forecast_hour.update(forecast_hour_params)
        format.html { redirect_to @forecast_hour, notice: 'Forecast hour was successfully updated.' }
        format.json { render :show, status: :ok, location: @forecast_hour }
      else
        format.html { render :edit }
        format.json { render json: @forecast_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forecast_hours/1
  # DELETE /forecast_hours/1.json
  def destroy
    @forecast_hour.destroy
    respond_to do |format|
      format.html { redirect_to forecast_hours_url, notice: 'Forecast hour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forecast_hour
      @forecast_hour = ForecastHour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forecast_hour_params
      params.require(:forecast_hour).permit(:disruption_level, :probability_of_occurence, :forecast_day_id)
    end
end
