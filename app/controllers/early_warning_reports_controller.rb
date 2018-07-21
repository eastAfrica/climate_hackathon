class EarlyWarningReportsController < ApplicationController
  before_action :set_early_warning_report, only: [:show, :edit, :update, :destroy]

  # GET /early_warning_reports
  # GET /early_warning_reports.json
  def index
    @early_warning_reports = EarlyWarningReport.all
  end

  # GET /early_warning_reports/1
  # GET /early_warning_reports/1.json
  def show
  end

  # GET /early_warning_reports/new
  def new
    @early_warning_report = EarlyWarningReport.new
  end

  # GET /early_warning_reports/1/edit
  def edit
  end

  # POST /early_warning_reports
  # POST /early_warning_reports.json
  def create
    @early_warning_report = EarlyWarningReport.new(early_warning_report_params)

    respond_to do |format|
      if @early_warning_report.save
        account_sid = 'AC254f16a7c2ab5efd2304fc342bdbad86'
        auth_token = 'c885e1f40ec7d0b9d7b048c65a12365c'
        client = Twilio::REST::Client.new(account_sid, auth_token)

        from = '+18643629235 ' # Your Twilio number
        to = '+250734598922' # Your mobile phone number

        client.messages.create(
        from: from,
        to: to,
        body: "Test from rails code!"
        )
        format.html { redirect_to @early_warning_report, notice: 'Early warning report was successfully created and SMS sent' }
        format.json { render :show, status: :created, location: @early_warning_report }
      else
        format.html { render :new }
        format.json { render json: @early_warning_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /early_warning_reports/1
  # PATCH/PUT /early_warning_reports/1.json
  def update
    respond_to do |format|
      if @early_warning_report.update(early_warning_report_params)
        format.html { redirect_to @early_warning_report, notice: 'Early warning report was successfully updated.' }
        format.json { render :show, status: :ok, location: @early_warning_report }
      else
        format.html { render :edit }
        format.json { render json: @early_warning_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /early_warning_reports/1
  # DELETE /early_warning_reports/1.json
  def destroy
    @early_warning_report.destroy
    respond_to do |format|
      format.html { redirect_to early_warning_reports_url, notice: 'Early warning report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_early_warning_report
      @early_warning_report = EarlyWarningReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def early_warning_report_params
      params.require(:early_warning_report).permit(:early_warning_id, :sector_id, :level, :feedback_id, :reciever_id)
    end
end
