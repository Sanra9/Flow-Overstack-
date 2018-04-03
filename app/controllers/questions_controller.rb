class QuestionsController < ApplicationController
  before_action :require_user, only: [:new, :sum]

  def index
    @questions = Question.all
  end

  def new
    @question= Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    @question.save
    redirect_to question_path(@question)
  end

  def show
    @question = Question.find(params[:id])
    @answer = @question.answers.new
    @comentario = @question.comentarios.new
    @comentarios = @question.comentarios
    @answers = @question.answers
    @d_vote = @question.votes.where(user:current_user)

  end

  def sum
      question=Question.find(params[:id])
			question.votes.create(user_id: current_user.id)
			redirect_to question_path
  end


  private
  def question_params
    params.require(:question).permit(:title, :description)
  end
end
