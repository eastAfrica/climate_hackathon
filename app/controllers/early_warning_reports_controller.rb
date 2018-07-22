class EarlyWarningReportsController < ApplicationController
  before_action :set_early_warning_report, only: [:show, :edit, :update, :destroy]

  # GET /early_warning_reports
  # GET /early_warning_reports.json
  def index
    @early_warning_reports = EarlyWarningReport.all
    @recievers = User.all
  end

  # GET /early_warning_reports/1
  # GET /early_warning_reports/1.json
  def show
  end

  # GET /early_warning_reports/new
  def new
    @recievers = User.all
    @early_warning_report = EarlyWarningReport.new
  end

  # GET /early_warning_reports/1/edit
  def edit
    @recievers = User.all
  end


  # POST /early_warning_reports
  # POST /early_warning_reports.json
  def create
    @early_warning_report = EarlyWarningReport.new(early_warning_report_params)
    recievers = early_warning_report_params['recieviers']
    level = early_warning_report_params['level']
    respond_to do |format|
      if @early_warning_report.save
        send_sms(recievers,level)
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
    def early_warning_report_params
      params.require(:early_warning_report).permit( :early_warning_id, :sector_id, :level, recieviers: [])
    end
    def send_sms(send_to,level)
      account_sid = ENV["pusher_app_id"]
      auth_token = ENV["pusher_key"]
      from = '+18643629235 ' # Your Twilio number
      array_of_rec = send_to.to_s.scan(/\d/).map(&:to_s)
      array_of_rec.each do |reciever|
        client = Twilio::REST::Client.new(account_sid, auth_token)
        rec = User.find(reciever)
        client.messages.create(
        from: from,
        to: '+25'+rec.phone_number,
        body: "Early # WARNING: in your sector! " + level
        )
      end
    end
end
