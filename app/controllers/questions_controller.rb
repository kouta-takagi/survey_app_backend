class QuestionsController < ApplicationController
  def index
    @questions = Survey.find(params[:survey_id]).questions.includes(:answers)
    render json: @questions, include: :answers
  end

  def create
    @question = Survey.find(params[:survey_id]).questions.new(question_params)
    if @question.save
      render json: @question, status: :created
    else
      render status: :unprocessable_entity
    end
  end

  private
  def question_params
    params.require(:question).permit(:content)
  end
end
