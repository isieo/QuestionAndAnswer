class AnswersController < ApplicationController
  before_filter :initialize_answer_session

  def index
    @answers = @answer_session.answers.all
  end

  def show
    @answer = @answer_session.answers.find(params[:id])
  end

  def new
    @answer = @answer_session.answers.new
    @answer.question = Question.random_unanswered(@answer_session).first
  end

  def create
    @answer = @answer_session.answers.new(params[:answer])
    @answer.answer_session = @answer_session
    if @answer.save
      redirect_to new_answer_session_answer_path(@answer_session), :notice => "Successfully created answer."
    else
      render :action => 'new'
    end
  end

  def edit
    @answer = @answer_session.answers.find(params[:id])
  end

  def update
    @answer = @answer_session.answers.find(params[:id])
    if @answer.update_attributes(params[:answer])
      redirect_to @answer, :notice  => "Successfully updated answer."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @answer = @answer_session.answers.find(params[:id])
    @answer.destroy
    redirect_to answers_url, :notice => "Successfully destroyed answer."
  end

  private
  def initialize_answer_session
    @answer_session= AnswerSession.find params[:answer_session_id]
  end
end

