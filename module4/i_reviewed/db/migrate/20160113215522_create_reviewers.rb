class CreateReviewers < ActiveRecord::Migration
  def change
    create_table :reviewers do |t|
      t.string :name
      t.string :password_diest

      t.timestamps null: false
    end
  end
end
