class AnswerSession < ActiveRecord::Base
  has_many :answers
  attr_accessible :user_id, :answer_id
  
  
  named_scope :remaining_questions, lambda { Question.count - answers.count }
end
