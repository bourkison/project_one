User.destroy_all

u1 = User.create :username => 'bourkison', :firstname => 'Harry', :lastname => 'Bourke', :email => 'harrisonbourke97@gmail.com', :dob => '1997/12/05', :password => 'chicken', :password_confirmation => 'chicken'
u2 = User.create :username => 'nothitler', :firstname => 'Kane', :lastname => 'Mott', :email => 'kmott@gmail.com', :dob => '1989/06/10', :password => 'chicken', :password_confirmation => 'chicken'


Post.destroy_all

p1 = Post.new :content => 'Wtf I love this website!', :image => ""
p2 = Post.new :content => 'This is great', :image => ""

Comment.destroy_all
# c1 = Post.new :content => 'Great Post! Totally agree', :image => ""
# c2 = Post.new :content => 'This sucks!', :image => ""




###############################################################
#
# Associations
#
###############################################################

u1.posts << p1
u2.posts << p2

u1.save
u2.save
p1.save
p2.save
