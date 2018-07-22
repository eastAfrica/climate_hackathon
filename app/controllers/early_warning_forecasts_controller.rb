class EarlyWarningForecastsController < ApplicationController
  before_action :set_early_warning_forecast, only: [:show, :edit, :update, :destroy]

  # GET /early_warning_forecasts
  # GET /early_warning_forecasts.json
  def index
    @early_warning_forecasts = EarlyWarningForecast.all
  end

  # GET /early_warning_forecasts/1
  # GET /early_warning_forecasts/1.json
  def show
  end

  # GET /early_warning_forecasts/new
  def new
    @early_warning_forecast = EarlyWarningForecast.new
    @levels = ['Grey', 'Yellow', 'Orange', 'Red']
    @probability = ['<15%', '>15% and <50%','≥50% and <85%','≥85%' ]
  end

  # GET /early_warning_forecasts/1/edit
  def edit
  end

  # POST /early_warning_forecasts
  # POST /early_warning_forecasts.json
  def create
    @early_warning_forecast = EarlyWarningForecast.new(early_warning_forecast_params)

    respond_to do |format|
      if @early_warning_forecast.save
        format.html { redirect_to @early_warning_forecast, notice: 'Early warning forecast was successfully created.' }
        format.json { render :show, status: :created, location: @early_warning_forecast }
      else
        format.html { render :new }
        format.json { render json: @early_warning_forecast.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /early_warning_forecasts/1
  # PATCH/PUT /early_warning_forecasts/1.json
  def update
    respond_to do |format|
      if @early_warning_forecast.update(early_warning_forecast_params)
        format.html { redirect_to @early_warning_forecast, notice: 'Early warning forecast was successfully updated.' }
        format.json { render :show, status: :ok, location: @early_warning_forecast }
      else
        format.html { render :edit }
        format.json { render json: @early_warning_forecast.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /early_warning_forecasts/1
  # DELETE /early_warning_forecasts/1.json
  def destroy
    @early_warning_forecast.destroy
    respond_to do |format|
      format.html { redirect_to early_warning_forecasts_url, notice: 'Early warning forecast was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_early_warning_forecast
      @early_warning_forecast = EarlyWarningForecast.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def early_warning_forecast_params
      params.require(:early_warning_forecast).permit(:district_id, forecast_days_attributes: [:day_of_forecast, :early_warning_forecast_id, :_destroy, forecast_hours_attributes: [:disruption_level, :probability_of_occurence, :hour, :forecast_day_id, :_destroy]])
    end
end
