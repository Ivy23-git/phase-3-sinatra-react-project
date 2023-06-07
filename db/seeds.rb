puts "🌱 Seeding spices..."

Project.destroy_all
ProjectMember.destroy_all
# Seed your database here
puts "Creating projects"
project1 = Project.create(username: 'ABC', title: 'Awesome Business Campaign', description: 'A marketing campaign for a business', user_id: 10)
project2 = Project.create(username: 'XYZ', title: 'Project XYZ', description: 'A software development project', user_id: 20)
project3 = Project.create(username: 'PQR', title: 'Product Quality Review', description: 'Evaluation of product quality standards', user_id: 30)
project4 = Project.create(username: 'LMN', title: 'Localization Management Initiative', description: 'Translation and localization project', user_id: 40)
project5 = Project.create(username: 'DEF', title: 'Data Encryption Framework', description: 'Development of a data encryption system', user_id: 50)

10.times do
  user = User.create(
    username: Faker::Internet.username,
    password: Faker::Internet.password,
    email: Faker::Internet.email
  )
end

puts "Creating members"
member1 = ProjectMember.create(username: 'John Smith', email: 'john.smith@gmail.com', user_id: 1, project_id: 1)
member2 = ProjectMember.create(username: 'Emily Johnson', email: 'emily.johnson@gmail.com', user_id: 2, project_id: 2)
member3 = ProjectMember.create(username: 'Michael Davis', email: 'michael.davis@gmail.com', user_id:3, project_id: 3)
member4 = ProjectMember.create(username: 'Sarah Thompson', email: 'sarah.thompson@gmail.com', user_id:4, project_id: 4)
member5 = ProjectMember.create(username: 'David Wilson', email: 'david.wilson@gmail.com', user_id:5, project_id: 5)


puts "✅ Done seeding!"
