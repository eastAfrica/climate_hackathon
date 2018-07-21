class ForecastDaysController < ApplicationController
  before_action :set_forecast_day, only: [:show, :edit, :update, :destroy]

  # GET /forecast_days
  # GET /forecast_days.json
  def index
    @forecast_days = ForecastDay.all
  end

  # GET /forecast_days/1
  # GET /forecast_days/1.json
  def show
  end

  # GET /forecast_days/new
  def new
    @forecast_day = ForecastDay.new
  end

  # GET /forecast_days/1/edit
  def edit
  end

  # POST /forecast_days
  # POST /forecast_days.json
  def create
    @forecast_day = ForecastDay.new(forecast_day_params)

    respond_to do |format|
      if @forecast_day.save
        format.html { redirect_to @forecast_day, notice: 'Forecast day was successfully created.' }
        format.json { render :show, status: :created, location: @forecast_day }
      else
        format.html { render :new }
        format.json { render json: @forecast_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forecast_days/1
  # PATCH/PUT /forecast_days/1.json
  def update
    respond_to do |format|
      if @forecast_day.update(forecast_day_params)
        format.html { redirect_to @forecast_day, notice: 'Forecast day was successfully updated.' }
        format.json { render :show, status: :ok, location: @forecast_day }
      else
        format.html { render :edit }
        format.json { render json: @forecast_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forecast_days/1
  # DELETE /forecast_days/1.json
  def destroy
    @forecast_day.destroy
    respond_to do |format|
      format.html { redirect_to forecast_days_url, notice: 'Forecast day was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forecast_day
      @forecast_day = ForecastDay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forecast_day_params
      params.require(:forecast_day).permit(:day_of_forecast, :early_warning_forecast_id, forecast_hours_attributes: [:disruption_level, :probability_of_occurence, :hour, :forecast_day_id, :_destroy])
    end
end
