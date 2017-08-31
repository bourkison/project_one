User.destroy_all

u1 = User.create :username => 'bourkison', :firstname => 'Harry', :lastname => 'Bourke', :email => 'harrisonbourke97@gmail.com', :dob => '1997/12/05', :password => 'chicken', :password_confirmation => 'chicken'
u2 = User.create :username => 'nothitler', :firstname => 'Kane', :lastname => 'Mott', :email => 'kmott@gmail.com', :dob => '1989/06/10', :password => 'chicken', :password_confirmation => 'chicken'
u3 = User.create :username => 'bobbymctittyface', :firstname => 'Bob', :lastname => 'Titan', :email => 'bt@gmail.com', :dob => '1965/10/10', :password => 'chicken', :password_confirmation => 'chicken'
u4 = User.create :username => 'leet420', :firstname => 'Matt', :lastname => 'Edge', :email => 'medge@ga.co', :dob => '1984/4/21', :password => 'chicken', :password_confirmation => 'chicken'
u5 = User.create :username => 'anonymous', :firstname => 'Anon', :lastname => 'Ymous', :email => 'anon@gmail.com', :dob => '2017/31/8', :password => 'chicken', :password_confirmation => 'chicken'


Post.destroy_all

p1 = Post.create :content => 'This meme is the best!', :image => "http://res.cloudinary.com/bourkison/image/upload/v1504155403/mmszkp5yoju1bb7x3dpn.jpg"
p2 = Post.create :content => 'Hate when this happens!', :image => "http://res.cloudinary.com/bourkison/image/upload/v1504155231/ojacowjsorrhkhnijmnr.png"

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

u1.comments << c2
u2.comments << c1

p1.comments << c1
p2.comments << c2
