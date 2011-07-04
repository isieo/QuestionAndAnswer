class QuestionGroupsController < ApplicationController
  # GET /question_groups
  # GET /question_groups.xml
  def index
    @question_groups = QuestionGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @question_groups }
    end
  end

  # GET /question_groups/1
  # GET /question_groups/1.xml
  def show
    @question_group = QuestionGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @question_group }
    end
  end

  # GET /question_groups/new
  # GET /question_groups/new.xml
  def new
    @question_group = QuestionGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @question_group }
    end
  end

  # GET /question_groups/1/edit
  def edit
    @question_group = QuestionGroup.find(params[:id])
  end

  # POST /question_groups
  # POST /question_groups.xml
  def create
    @question_group = QuestionGroup.new(params[:question_group])

    respond_to do |format|
      if @question_group.save
        format.html { redirect_to(@question_group, :notice => 'Question group was successfully created.') }
        format.xml  { render :xml => @question_group, :status => :created, :location => @question_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @question_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /question_groups/1
  # PUT /question_groups/1.xml
  def update
    @question_group = QuestionGroup.find(params[:id])

    respond_to do |format|
      if @question_group.update_attributes(params[:question_group])
        format.html { redirect_to(@question_group, :notice => 'Question group was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @question_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /question_groups/1
  # DELETE /question_groups/1.xml
  def destroy
    @question_group = QuestionGroup.find(params[:id])
    @question_group.destroy

    respond_to do |format|
      format.html { redirect_to(question_groups_url) }
      format.xml  { head :ok }
    end
  end
end
