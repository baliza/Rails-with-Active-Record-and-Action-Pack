class FixtColumnName < ActiveRecord::Migration
  def change
	rename_column :people, :lastname, :last_name
  end
end
