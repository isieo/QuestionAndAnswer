require 'test_helper'

class QuestionGroupTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert QuestionGroup.new.valid?
  end
end
