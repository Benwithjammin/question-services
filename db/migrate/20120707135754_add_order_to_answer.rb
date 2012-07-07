class AddOrderToAnswer < ActiveRecord::Migration

  def up
    add_column :answers, :order, :integer, null: false
  end

  def down
    remove_column :answers, :order
  end

end
