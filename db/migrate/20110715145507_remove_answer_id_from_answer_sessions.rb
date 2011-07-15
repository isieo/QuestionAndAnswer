class RemoveAnswerIdFromAnswerSessions < ActiveRecord::Migration
  def self.up
    remove_column(:answer_sessions, :answer_id)
  end

  def self.down
    add_column(:answer_sessions, :answer_id, :integer)
  end
end

