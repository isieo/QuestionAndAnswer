class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :answer_session
  attr_accessible :question_id, :value, :answer_session_id
  
end
