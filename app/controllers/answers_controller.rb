class AnswersController < ApplicationController
  before_action :authenticate_user!

  def index
    @answers = Question.find(params[:question_id]).answers
    render json: @answers
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        params[:answers].each do |index, response|
          Question.find(index).answers.create(response: response, user: current_user)
        end
      end
    rescue => e
      puts "トランザクションが失敗しました: #{e.message}"
      render status: :unprocessable_entity
    end
    render json: { message: "解答の作成が成功しました" }, status: :created
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
