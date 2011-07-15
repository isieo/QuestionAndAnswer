require 'test_helper'

class AnswerSessionTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert AnswerSession.new.valid?
  end
end
