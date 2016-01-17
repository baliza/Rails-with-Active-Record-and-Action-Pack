class AddDueDateAndTitleAndDescriptionToTodoitem < ActiveRecord::Migration
  def change
    add_column :todo_items, :due_date, :date
    add_column :todo_items, :title, :string
    add_column :todo_items, :description, :text
  end
end
