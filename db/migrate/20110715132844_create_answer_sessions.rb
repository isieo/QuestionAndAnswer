class CreateAnswerSessions < ActiveRecord::Migration
  def self.up
    create_table :answer_sessions do |t|
      t.integer :user_id
      t.integer :answer_id
      t.timestamps
    end
  end

  def self.down
    drop_table :answer_sessions
  end
end
