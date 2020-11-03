class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update,]

  def index
    @questions = Question.order('created_at DESC')
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  private
  
  def question_params
    params.require(:question).permit(:category_id, :title, :text).merge(user_id: current_user.id)
  end
end
