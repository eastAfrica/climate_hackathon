class SurveysController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    puts '--------------------------------- I am called ---------------------  '
    @survey = Survey.includes(:questions).first
  end

  def after_record
      recording_url = params['RecordingUrl']
      caller_id = params['From']
      puts "---------------------------------------- uRRRRRRRRRRRRRRl is  " + url
  end

  def voice
    survey = Survey.first
    render xml: welcome_message_for_voice(survey)
  end

  def sms
    user_response = params[:Body]
    from          = params[:From]
    render xml: SMS::ReplyProcessor.process(user_response, from, cookies)
  end

  private

  def welcome_message_for_voice(survey)
    Twilio::TwiML::VoiceResponse.new do |r|
        r.say(message: 'Hello. Please leave a feedback for the disaster.')
        puts '--------------------------------- Recording started ---------------------  '
        r.record action:  "/survey/after_record"
        # puts 'The value of record is  -------------------------------------------------  '+a
        r.hangup
        puts '--------------------------------- Recording Ended ---------------------  '

    end.to_s
    end




  # end
end
