class CreateQuestionGroups < ActiveRecord::Migration
  def self.up
    create_table :question_groups do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :question_groups
  end
end
