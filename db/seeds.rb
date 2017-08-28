User.destroy_all

u1 = User.create :username => 'bourkison', :firstname => 'Harry', :lastname => 'Bourke', :email => 'harrisonbourke97@gmail.com', :dob => '1997/12/05', :password => 'chicken', :password_confirmation => 'chicken'
u2 = User.create :username => 'nothitler', :firstname => 'Kane', :lastname => 'Mott', :email => 'kmott@gmail.com', :dob => '1989/06/10', :password => 'chicken', :password_confirmation => 'chicken'


Post.destroy_all

p1 = Post.create :content => 'Wtf I love this website!', :image => ""
p2 = Post.create :content => 'This is great', :image => ""

Comment.destroy_all
c1 = Comment.create :content => 'Great Post! Totally agree'
c2 = Comment.create :content => 'This sucks!'



###############################################################
#
# Associations
#
###############################################################

u1.posts << p1
u2.posts << p2

u1.comments << c1
u2.comments << c2

p1.comments << c1
p2.comments << c2
