class Question < ActiveRecord::Base
  attr_accessible :title, :description, :question_group_id

  named_scope :randomize, :order=>'rand()'
  named_scope :random_unanswered, lambda {|answer_session|
                                          {:conditions=>['id not in (?)',answer_session.answers.collect {|answer| answer.id }.join(',')] ,:order=>'rand()'}
                                          }

end

