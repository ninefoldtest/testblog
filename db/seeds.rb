User.destroy_all
Post.destroy_all
Comment.destroy_all


u1 = User.create(:name => "Corinne", :password => "password", :password_confirmation => "password")

p1 = Post.create(:title => "First Post", :body => "Hello World!")
p2 = Post.create(:title => "Second Post", :body => "Hello Again")

u1.posts << p1