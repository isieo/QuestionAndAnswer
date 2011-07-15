require 'test_helper'

class QuestionGroupsTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert QuestionGroups.new.valid?
  end
end
