def sample_file(filename = "sample_file.png")
  File.new("app/assets/images/#{filename}")
end


u1 = User.create(username: 'alice', password: 'password')
u2 = User.create(username: 'bob', password: 'password')
u3 = User.create(username: 'charles', password: 'password')
u4 = User.create(username: 'dan', password: 'password')
u5 = User.create(username: 'earl', password: 'password')
u6 = User.create(username: 'fiona', password: 'password')
u7 = User.create(username: 'george', password: 'password')
u8 = User.create(username: 'hilary', password: 'password')
u9 = User.create(username: 'ira', password: 'password')
u10 = User.create(username: 'jason', password: 'password')

p1 = u1.projects.create(title: 'CoffeeBar — College Students Create a Way to EAT Your Coffee', target_amount: 10000, end_date: DateTime.strptime("09/25/2014", "%m/%d/%Y"), category_id:1, description: "The CoffeeBar is an all natural energy bar infused with real coffee. Tastes delicious. No additives. Made in the USA. EAT your coffee!", seed_flg: true)
p2 = u2.projects.create(title: 'Wondermark’s Jigsaw Puzzles of Fictional Victorian Charts', target_amount: 50000, end_date: DateTime.strptime("10/21/2014", "%m/%d/%Y"), category_id:2 ,description: "What if the Victorian era had more jokes AND was more diagram-based AND was made of jigsaw puzzles?? WONDER...NO MORE", seed_flg: true)


b1 = p1.backs.create(user_id: 2, project_id: 1, amount: 100 )
b2 = p1.backs.create(user_id: 3, project_id: 1, amount: 200 )
b3 = p1.backs.create(user_id: 4, project_id: 1, amount: 300 )
b4 = p1.backs.create(user_id: 5, project_id: 1, amount: 400 )
b5 = p1.backs.create(user_id: 6, project_id: 1, amount: 500 )
b6 = p1.backs.create(user_id: 7, project_id: 1, amount: 600 )
b7 = p1.backs.create(user_id: 8, project_id: 1, amount: 700 )
b8 = p1.backs.create(user_id: 9, project_id: 1, amount: 800 )
