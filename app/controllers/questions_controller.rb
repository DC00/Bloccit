class QuestionsController < ApplicationController
  def index
    @question = Question.all
  end

  def new
    @question = Question.new
  end

  def create
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
