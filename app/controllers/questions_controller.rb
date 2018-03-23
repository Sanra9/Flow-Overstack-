class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @question.answers
    @question.answers.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  private
  def question_params
    params.require(:question).permit(:name, :description, :vote)
  end
end
