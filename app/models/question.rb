class Question < ActiveRecord::Base
  attr_accessible :title, :description, :question_group_id
end
