class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :question_type
      t.integer :user_id

      t.timestamps
    end
  end
end
