class RemoveQuestionTypeFromQuestion < ActiveRecord::Migration
  def up
    remove_column :questions, :question_type
    add_column :questions, :image, :string
  end

  def down
    add_column :questions, :question_type, :string
    remove_column :questions, :image
  end
end
