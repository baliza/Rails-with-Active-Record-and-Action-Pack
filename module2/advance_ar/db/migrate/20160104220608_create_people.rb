class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.integer :age
      t.string :lastname

      t.timestamps null: false
    end
  end
end
