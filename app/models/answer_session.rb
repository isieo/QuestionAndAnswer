class AnswerSession < ActiveRecord::Base
  has_many :answers
  belongs_to :user
  attr_accessible :user_id

  named_scope :for_user, lambda { |current_user| { :conditions=>{:user_id=> current_user.id} }}
  
  def remaining_questions
   Question.count - self.answers.count
  end
  
  

end

