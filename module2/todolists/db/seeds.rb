# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



#Carly	Fiorina,	1954
#Donald	Trump,	1946
#Ben	Carson,	1951
#Hillary	Clinton,	1947



TodoList.destroy_all
Profile.destroy_all
User.destroy_all


User.create! [
  { username: "Fiorina", password_digest: "CarlyFiorina" },
  { username: "Trump", password_digest: "DonaldTrump" },
  { username: "Carson", password_digest: "BenCarson" },
  { username: "Clinton", password_digest: "HillaryClinton" },
]

User.find_by!(username: "Fiorina").create_profile(
	first_name: "Carly", last_name:"Fiorina", birth_year: 1954, gender: "female")
User.find_by!(username: "Trump").create_profile(
	first_name: "Donald", last_name:"Trump", birth_year: 1946, gender: "male")
User.find_by!(username: "Carson").create_profile(
	first_name: "Ben", last_name:"Carson", birth_year: 1951, gender: "male")
User.find_by!(username: "Clinton").create_profile(
	first_name: "Hillary", last_name:"Clinton", birth_year: 1947, gender: "female")


User.all.each do |u|
	u.todo_lists.create!(
		list_name: "#{u.username}_todo_list", list_due_date: Date.today + 1.year)
end

TodoList.all.each do |tl|
	5.times do |t|
		due_date = Date.today + 1.year
		title= "#{tl.list_name}_item_#{t}"
		description= "#{tl.list_name}_item_#{t}_description"
		completed= true		
		tl.todo_items.create! due_date: due_date, title: title, description: description, completed: completed

	end
end
