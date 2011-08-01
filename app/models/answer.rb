class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :answer_session
  attr_accessible :question_id, :value, :answer_session_id
  validates_uniqueness_of :question_id, :scope => [:answer_session_id, :question_id]
  validates_presence_of :value
  
  
  named_scope :for_group, lambda { |group| {:include => :question, :conditions => ['questions.question_group_id=?',group.id]}}
end
