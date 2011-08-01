require 'google_chart'
class AnswersController < ApplicationController
  before_filter :initialize_answer_session


  def index
    @answers = @answer_session.answers.all
    answer_by_session = AnswerSession.find_by_id(@answer_session.id)
    question_group = QuestionGroup.all
    
    GoogleChart::BarChart.new('600x300', "Bar Chart", :horizontal, false) do |bc|
      label_value = []
      for group in question_group
        if group.name == "Blue"
          color = '0000ff'
        elsif group.name == "Green"
          color = '008000'
        elsif group.name == "Red"
          color = 'FF0000'
        else
          color = 'FFFF00'
        end
        value = answer_by_session.answers.all(:include => :question, :conditions => ['questions.question_group_id=?',group.id]).length
        bc.data group.name, [value], color
        label_value.push(group.name)
      end
        bc.axis :y, :labels => ["Red","Blue","Green", "Yellow"], :font_size => 12
        #bc.axis :y, :labels => label_value, :font_size => 12
        bc.axis :x, :range => [0,72]
        bc.data_encoding = :extended

        puts "\nBar Chart"
        @chart = bc.to_url
    end
    
  end

  def show
    @answer = @answer_session.answers.find(params[:id])
  end

  def new
    @answer = @answer_session.answers.new
    @question = @answer_session.answers.length > 0 ? Question.random_unanswered(@answer_session).first : Question.first(:order => 'RAND()')
    #sql_string = 'select * from questions where id not in (select question_id from answers where answer_session_id="' + @answer_session.id.to_s + '")'
  
    #unanswered_array = Question.find(:all, :conditions => ["id NOT IN (?)",Answer.find_all_by_answer_session_id(@answer_session.id).collect{|a| a.question_id}])
    if @question.nil?
      redirect_to answer_session_answers_path, :notice => "All question answered"
    end
    
  end

  def create
    @answer = @answer_session.answers.new(params[:answer])
    @answer.answer_session = @answer_session
    if @answer.save
      redirect_to new_answer_session_answer_path(@answer_session), :notice => "Successfully created answer."
    else
      @question = Question.random_unanswered(@answer_session).first
      render :action => 'new'
    end
  end

  def edit
    @answer = @answer_session.answers.find(params[:id])
    @question = @answer.question
  end

  def update
    @answer = @answer_session.answers.find(params[:id])
    if @answer.update_attributes(params[:answer])
      redirect_to answer_session_answers_path, :notice  => "Successfully updated answer."
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

