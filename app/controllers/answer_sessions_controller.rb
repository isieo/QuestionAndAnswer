class AnswerSessionsController < ApplicationController
  # GET /answer_sessions
  # GET /answer_sessions.xml
  def index
    @answer_sessions = AnswerSession.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @answer_sessions }
    end
  end

  # GET /answer_sessions/1
  # GET /answer_sessions/1.xml
  def show
    @answer_session = AnswerSession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @answer_session }
    end
  end

  # GET /answer_sessions/new
  # GET /answer_sessions/new.xml
  def new
    @answer_session = AnswerSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @answer_session }
    end
  end

  # GET /answer_sessions/1/edit
  def edit
    @answer_session = AnswerSession.find(params[:id])
  end

  # POST /answer_sessions
  # POST /answer_sessions.xml
  def create
    @answer_session = AnswerSession.new(params[:answer_session])

    respond_to do |format|
      if @answer_session.save
        format.html { redirect_to(@answer_session, :notice => 'Answer session was successfully created.') }
        format.xml  { render :xml => @answer_session, :status => :created, :location => @answer_session }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @answer_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /answer_sessions/1
  # PUT /answer_sessions/1.xml
  def update
    @answer_session = AnswerSession.find(params[:id])

    respond_to do |format|
      if @answer_session.update_attributes(params[:answer_session])
        format.html { redirect_to(@answer_session, :notice => 'Answer session was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @answer_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /answer_sessions/1
  # DELETE /answer_sessions/1.xml
  def destroy
    @answer_session = AnswerSession.find(params[:id])
    @answer_session.destroy

    respond_to do |format|
      format.html { redirect_to(answer_sessions_url) }
      format.xml  { head :ok }
    end
  end
end
