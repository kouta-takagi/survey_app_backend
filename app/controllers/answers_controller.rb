class AnswersController < ApplicationController
  def index
    @answers = Question.find(params[:question_id]).answers
    render json: @answers
  end

  def create
    # @answer = Question.find(params[:question_id]).answers.new(answer_params)
    @answer = Answer.new
    if @answer.save
      render json: @answer, status: :created
    else
      render json: @answer.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:response)
  end
end
