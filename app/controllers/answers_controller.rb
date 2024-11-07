class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      render status: :created
    else
      render status: :unprocessable_entity
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:response, :question_id)
  end
end
