namespace :db do
	desc " Fill data base with sample data"
	task populate: :environment do
		create_users
	end
end


#task create User

def create_users 
	User.create!(	name: "Phoenix Ta",
					email: "phoenixta@ymail.com",
					password: "123456",
					password_confirmation:"123456",
					admin: true
				)
	50.times do |n|
		name = Faker::Name.name
		email = "example-#{n+1}@gmail.com"
		password = "123456"
		User.create!(	name: name,
						email: email,
						password: password,
						password_confirmation: password
					)
	end
end
