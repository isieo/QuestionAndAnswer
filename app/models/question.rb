class Question < ActiveRecord::Base
  attr_accessible :title, :description, :question_group_id

  named_scope :randomize, :order=>'rand()'
  named_scope :random_unanswered, lambda {|answer_session|
                {:conditions=>['id not in (?)',answer_session.answers.collect {|answer| answer.question_id }], :order=>"RAND()"}
                                          }
#Question.find(:all, :conditions => ["id NOT IN (?)",Answer.find_all_by_answer_session_id(@answer_session.id).collect{|a| a.question_id}])
end

