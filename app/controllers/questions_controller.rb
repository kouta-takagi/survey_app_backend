class QuestionsController < ApplicationController
  def create
    @question = Question.new(question_params)
    if @question.save
      render status: :created
    else
      render status: :unprocessable_entity
    end
  end

  private
  def question_params
    params.require(:question).permit(:content, :survey_id)
  end
end
