class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  def index
    @feedbacks = Feedback.all
  end

  def voice
    survey = Survey.first
    render xml: welcome_message_for_voice(survey)
  end

  def sms
    user_response = params[:RecordingUrl]
    from          = params[:From]
    render xml: SMS::ReplyProcessor.process(user_response, from, cookies)
  end

  def after_record
      recording_url = params['RecordingUrl']
      caller_id = params['From']
      @feedback = Feedback.new
      @feedback.caller_id = caller_id
      @feedback.audio_url = recording_url
      @feedback.report_id = 1
      @feedback.save
      # data = {'recording_url': recording_url,'caller_id': caller_id , 'report_id':1}
      #
      # puts '======================================================= '+ data.to_s
      # redirect_to  "http://localhost:3000/feedbacks_save_from_ngork?data="+ data.to_s
      respond_to do |format|
          format.html { redirect_to @feedback, notice: 'Feedback was successfully updated.' }
          format.json { render :show, status: :ok, location: @feedback }
      end
  end

  def save_from_ngork
    data = params#['data']
    recording_url = data['RecordingUrl']
    caller_id = data['From']
    @feedback = Feedback.new(:caller_id => 1, :report_id => 1, :audio_url => recording_url)
    respond_to do |format|
      if @feedback.save
        format.html { redirect_to @feedback, notice: 'Feedback was successfully created.' }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render :new }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
  end

  # GET /feedbacks/1/edit
  def edit
  end

  # POST /feedbacks
  # POST /feedbacks.json
  def create
    data = params#['data']
    recording_url = data['RecordingUrl']
    caller_id = data['From']
    @feedback = Feedback.new(feedback_params)
    @feedback.caller_id = caller_id
    @feedback.audio_url = recording_url

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to @feedback, notice: 'Feedback was successfully created.' }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render :new }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feedbacks/1
  # PATCH/PUT /feedbacks/1.json
  def update
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html { redirect_to @feedback, notice: 'Feedback was successfully updated.' }
        format.json { render :show, status: :ok, location: @feedback }
      else
        format.html { render :edit }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  def destroy
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to feedbacks_url, notice: 'Feedback was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feedback_params
      params.require(:feedback).permit(:caller_id, :report_id, :audio_url)
    end
end