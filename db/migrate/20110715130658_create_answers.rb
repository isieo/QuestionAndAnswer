class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.string :question_id
      t.integer :value
      t.integer :answer_session_id
      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
