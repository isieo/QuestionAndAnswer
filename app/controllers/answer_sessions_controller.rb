class AnswerSessionsController < ApplicationController
  def index
    @answer_sessions = AnswerSession.for_user(current_user)
    @answer_session = AnswerSession.new()
  end

  def show
    @answer_session = AnswerSession.for_user(current_user).find(params[:id])
  end

  def new
    @answer_session = current_user.answer_sessions << AnswerSession.new()
    redirect_to answer_session_answer_path @answer_session
  end

  def create
    @answer_session = current_user.answer_sessions.new(params[:answer_session])
    if @answer_session.save
      redirect_to new_answer_session_answer_path(@answer_session), :notice => "Successfully created answer session."
    else
      render :action => 'new'
    end
  end

  def edit
    @answer_session = AnswerSession.for_user(current_user).find(params[:id])
  end

  def update
    @answer_session = AnswerSession.for_user(current_user).find(params[:id])
    if @answer_session.update_attributes(params[:answer_session])
      redirect_to @answer_session, :notice  => "Successfully updated answer session."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @answer_session = AnswerSession.for_user(current_user).find(params[:id])
    @answer_session.destroy
    redirect_to answer_sessions_url, :notice => "Successfully destroyed answer session."
  end
end

