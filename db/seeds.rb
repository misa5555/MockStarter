require 'faker'
# generate user data
# 10.times do |i|
#   User.create!(username: Faker::Name.name, password: 'password')
# end

# generate project data
# 30.times do |i|
#   user = User.find( (i % 10)  + 1)
#   user.projects.create(title: Faker::Company.name, target_amount: 10000 + rand(100)*10, end_date: Date.today + (400 + rand(400)), category_id: rand(14), description: Faker::Lorem.paragraph)
# end

project_count = Project.all.count
user_count = User.all.count

# generate back data
for i in 31..project_count  
  project = Project.find(i)
  user_index = Array 1..user_count
  user_index.sample(1+rand(5)).each do |j|
    if project.creator.id != j
      project.backs.create(user_id: j, project_id: project.id, amount:rand(1000))
    end
  end
end

for i in 31..project_count  
  project = Project.find(i)
  user_num = User.all.count
  rand(5).times do
    project.comments.create( body: Faker::Lorem.sentence(), project_id: project.id, author_id: rand(user_num))
  end  
end
