class AnswersController < ApplicationController
  before_action :authenticate_user!

  def index
    @answers = Question.find(params[:question_id]).answers
    render json: @answers
  end

  def create
    begin
      @questions= []
      ActiveRecord::Base.transaction do
        params[:answers].each do |index, response|
          question = Question.find(index).answers.create!(response: response, user: current_user)
          @questions << question
        end
      end
      render json: { message: "解答の作成が成功しました" }, status: :created
    rescue
      render json: { message: "すべてのフォームを入力してください" }, status: :unprocessable_entity
    end


    # @answer = Question.find(params[:question_id]).answers.new(answer_params)
    # @answer.user = current_user

    # if @answer.save
    #   render json: @answer, status: :created
    # else
    #   render json: @answer.errors.full_messages, status: :unprocessable_entity
    # end
  end

  # private
  # def answer_params
  #   params.require(:answer).permit(:response)
  # end
end
