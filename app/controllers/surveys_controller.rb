class SurveysController < ApplicationController
  before_action :authenticate_user!

  def index
    @surveys = Survey.all
    render json: @surveys
  end

  def show
    @survey = Survey.find(params[:id])
    @questions = @survey.questions.includes(:answers)
    render json: @survey
  end

  def create
    @survey = current_user.surveys.new(survey_params)
    if @survey.save
      render json: @survey, status: :created
    else
      render json: @survey.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def survey_params
    params.require(:survey).permit(:title, :description)
  end
end
