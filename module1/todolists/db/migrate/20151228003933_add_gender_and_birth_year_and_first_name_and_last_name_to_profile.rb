class AddGenderAndBirthYearAndFirstNameAndLastNameToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :gender, :string
    add_column :profiles, :birth_year, :integer
    add_column :profiles, :first_name, :string
    add_column :profiles, :last_name, :string
  end
end
