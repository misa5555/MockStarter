u1 = User.create(username: 'alice', password: 'password')
u2 = User.create(username: 'bob', password: 'password')

p1 = u1.projects.create(title: 'The Hive', target_amount: 10000, start_date: DateTime.strptime("09/23/2014", "%m/%d/%Y"), end_date: DateTime.strptime("09/25/2014", "%m/%d/%Y"), category_id:1);
p2 = u2.projects.create(title: 'Coffee & Meeting House', target_amount: 50000, start_date: DateTime.strptime("08/21/2014", "%m/%d/%Y"), end_date: DateTime.strptime("10/21/2014", "%m/%d/%Y"), category_id:2);
