class QuestionGroupsController < ApplicationController
  def index
    @question_groups = QuestionGroup.all
  end

  def show
    @question_group = QuestionGroup.find(params[:id])
  end

  def new
    @question_group = QuestionGroup.new
  end

  def create
    @question_group = QuestionGroup.new(params[:question_group])
    if @question_group.save
      redirect_to @question_group, :notice => "Successfully created question group."
    else
      render :action => 'new'
    end
  end

  def edit
    @question_group = QuestionGroup.find(params[:id])
  end

  def update
    @question_group = QuestionGroup.find(params[:id])
    if @question_group.update_attributes(params[:question_group])
      redirect_to @question_group, :notice  => "Successfully updated question group."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @question_group = QuestionGroup.find(params[:id])
    @question_group.destroy
    redirect_to question_groups_url, :notice => "Successfully destroyed question group."
  end
end
