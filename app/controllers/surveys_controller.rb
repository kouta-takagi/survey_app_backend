class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
    render json @surveys
  end

  def show
    @survey = Survey.find(params[:id])
    @questions = @survey.questions.includes(:answers)
    render json: {
      survey: @survey,
      questions: @questions.as_json(include: :answers)
    }
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      render status: :created
    else
      render status: :unprocessable_entity
    end
  end

  private
  def survey_params
    params.require(:survey).permit(:title, :description)
  end
end
