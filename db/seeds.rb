#This file serves purely to test classes and models as you build the program
require_relative '../config/environment' 


User.destroy_all
Artist.destroy_all
UserArtist.destroy_all
Connection.destroy_all
Rejection.destroy_all
Genre.destroy_all
ArtistGenre.destroy_all


#this will return the artist at the end, but be wary that it returns an object, not DB access
def add_artistgenre_seed(artist_name)
    spotify_artist = RSpotify::Artist.search(artist_name).first
    new_artist = Artist.verify_artist(spotify_artist)
    new_genres = Genre.verify_genre(spotify_artist)
    ArtistGenre.verify_artistgenre(new_artist, new_genres)
    new_artist 
end


def create_profile(artist_array,user_details)
    user = User.create(name: user_details[0], age: user_details[1], city: user_details[2], email: user_details[3])

    artist_array.each do |artist_name|
        artist = add_artistgenre_seed(artist_name)
        UserArtist.create(user: user, artist: artist)
    end
    puts "#{user_details[0]} done"
end


#profile: user 1
user= ["Monique Chance", 30, "Jersey","monique@totallyfake.com"]
artists = ["Kanye West","J Cole","Chris Brown","Drake","Nicki Minaj","Jay-z","Summer Walker", "Jhene Aiko", "Dababy","Big Sean"]
create_profile(artists,user)



#profile: user 2
user= ["Bridget Brito", 24, "Bronx","bridget@totallyfake.com"]
artists = ["Bad Bunny","NCT 127","hasley","j cole","EXO","Childish Gambino","Billie Eilish","Fleetwood Mac","Jessie Reyez","6lack"]
create_profile(artists,user)

#profile : user 3
user= ["Sharina Aybar", 25, "Bronx","sharina@totallyfake.com"]
artists = ["Circa Survive","j cole", "Mac Miller", "Earthgang", "eli sostre", "bryson tiller", "etta james","billie holiday",'kimbra',"gary moore"]
create_profile(artists,user)

#profile : user 4
user= ["Crystal Santiago", 26, "Bronx","crystal@totallyfake.com"]
artists = ["george ezra", "vance joy","bad bunny","big wild","summer walker","hobo johnson","bazzi","post malone","travis scott",'ozuna']
create_profile(artists,user)

#profile : user 5
user= ["Kate McDonnell", 26, "Ireland","kate@totallyfake.com"]
artists = ["the 1975","cardi b","dua lipa","artic monkeys","gun n roses","bruno mars","beyonce","fleetwood mac","lady gaga","Michael jackson"]
create_profile(artists,user)

#profile: user 6
user= ["Seongkon Kang", 30, "Flushing","seong@totallyfake.com"]
artists = ["slowthai","grace craters","little simz","dermot kennedy","lewis capaldi","ry x","mf doom","four tet","dj okawari","run the jewels"]
create_profile(artists,user)

#profile: user 7
user= ["Edwin Casado", 28, "West New York","edwin@totallyfake.com"]
artists = ["heroes del silencio","the smashing pumpkins","toque profundo",'tabutek',"iron maiden","coheed and cambria","radiohead","soda stereo","la ley","the shins"]
create_profile(artists,user)

#profile: user 8
user= ["Andrew Mavricos", 30, "Chicago","andrew@totallyfake.com"]
artists = ["Dropkick Murphys","queen","acdc","nwa","run dmc","eminem","aerosmith","journey","stevie nix","led zeppelin"]
create_profile(artists,user)

#profile: user 9
user= ["Steve", 33, "Metro North","steve@totallyfake.com"]
artists = ["Streetlight Manifesto","The Offspring","Less than Jake","Sublime","No Doubt","weezer","Catch 22","nirvana","dead kennedys","coheed and cambria"]
create_profile(artists,user)

#profile: user 10
user= ["Cool Mike", 69, "Coolsville","coolmike@totallyfake.com"]
artists = ["Boogaloo Assassins","The Cat Empire","celia cruz","bruno mars","southern culture on the skids","metallica","Waka flocka flame","the hives","fulanito","nujabes"]
create_profile(artists,user)

#profile: user 11
user= ["Isabel", 24, "Coolsville","coolmike@totallyfake.com"]
artists = ["Juan luis guerra","my chemical romance","AFI","maleek berry","mc kevin","led zepplin","damian & brothers","linkin park","the offsprings","Less than Jake"]
create_profile(artists,user)


# #profile: alt-rock fan
# a11 = add_artistgenre_seed("Guided By Voices")
# a12 = add_artistgenre_seed("Tame Impala")
# a13 = add_artistgenre_seed("Pavement")
# a14 = add_artistgenre_seed("Silver Jews")
# a15  = add_artistgenre_seed("Nirvana")
# a16 = add_artistgenre_seed("Stereolab")
# a17  = add_artistgenre_seed("Dope Smoker")
# a18  = add_artistgenre_seed("Boris")
# a19 = add_artistgenre_seed("The Minutemen")
# a110 = add_artistgenre_seed("The Smashing Pumpkins")
# alt_rock_u1 = User.create(name:"Krystal", age: 23, city: "NYC", email: "krystalemail")
# UserArtist.create(user: alt_rock_u1, artist: a11)
# UserArtist.create(user: alt_rock_u1, artist: a12)
# UserArtist.create(user: alt_rock_u1, artist: a13)
# UserArtist.create(user: alt_rock_u1, artist: a14)
# UserArtist.create(user: alt_rock_u1, artist: a15)
# UserArtist.create(user: alt_rock_u1, artist: a16)
# UserArtist.create(user: alt_rock_u1, artist: a17)
# UserArtist.create(user: alt_rock_u1, artist: a18)
# UserArtist.create(user: alt_rock_u1, artist: a19)
# UserArtist.create(user: alt_rock_u1, artist: a110)

# #profile: hip-hop fan
# a21 = add_artistgenre_seed("Kanye West")
# a22 = add_artistgenre_seed("JAY-Z")
# a23 = add_artistgenre_seed("Chance The Rapper")
# a24  = add_artistgenre_seed("MF DOOM")
# a25  = add_artistgenre_seed("Rihanna")
# a26  = add_artistgenre_seed("Tupac")
# a27  = add_artistgenre_seed("Notorious B.I.G")
# a28  = add_artistgenre_seed("The Roots")
# a29  = add_artistgenre_seed("Gangstarr")
# a210 = add_artistgenre_seed("Childish Gambino")
# hip_hop_u1 = User.create(name:"bill", age: 23, city: "NYC", email: "billemail")
# UserArtist.create(user: hip_hop_u1, artist: a21)
# UserArtist.create(user: hip_hop_u1, artist: a22)
# UserArtist.create(user: hip_hop_u1, artist: a23)
# UserArtist.create(user: hip_hop_u1, artist: a24)
# UserArtist.create(user: hip_hop_u1, artist: a25)
# UserArtist.create(user: hip_hop_u1, artist: a26)
# UserArtist.create(user: hip_hop_u1, artist: a27)
# UserArtist.create(user: hip_hop_u1, artist: a28)
# UserArtist.create(user: hip_hop_u1, artist: a29)
# UserArtist.create(user: hip_hop_u1, artist: a210)

# #profile: pop fan
# a31 = add_artistgenre_seed("Kanye West")
# a32 = add_artistgenre_seed("Rihanna")
# a33 = add_artistgenre_seed("Tame Impala")
# a34 = add_artistgenre_seed("Billie Eilish")
# a35  = add_artistgenre_seed("Justin Bieber")
# a36 = add_artistgenre_seed("Maroon 5")
# a37  = add_artistgenre_seed("Ed Sheeran")
# a38  = add_artistgenre_seed("Michael Jackson")
# a39 = add_artistgenre_seed("Sean Paul")
# a310 = add_artistgenre_seed("Eminem")
# pop_u1 = User.create(name:"cameron", age: 43, city: "NYC", email: "cameronemail")
# UserArtist.create(user: pop_u1, artist: a31)
# UserArtist.create(user: pop_u1, artist: a32)
# UserArtist.create(user: pop_u1, artist: a33)
# UserArtist.create(user: pop_u1, artist: a34)
# UserArtist.create(user: pop_u1, artist: a35)
# UserArtist.create(user: pop_u1, artist: a36)
# UserArtist.create(user: pop_u1, artist: a37)
# UserArtist.create(user: pop_u1, artist: a38)
# UserArtist.create(user: pop_u1, artist: a39)
# UserArtist.create(user: pop_u1, artist: a310)

# #profile: grunge fan
# a41 = add_artistgenre_seed("Nirvana")
# a42 = add_artistgenre_seed("Pearl Jam")
# a43 = add_artistgenre_seed("Alice in Chains")
# a44 = add_artistgenre_seed("The Smashing Pumpkins")
# a45  = add_artistgenre_seed("Pavement")
# a46 = add_artistgenre_seed("Soundgarden")
# a47  = add_artistgenre_seed("Guided By Voices")
# a48  = add_artistgenre_seed("Stone Temple Pilots")
# a49 = add_artistgenre_seed("Korn")
# a410 = add_artistgenre_seed("Limp Bizkit")
# grunge_u1 = User.create(name:"vandad", age: 37, city: "Brooklyn", email: "vandademail")
# UserArtist.create(user: grunge_u1, artist: a41)
# UserArtist.create(user: grunge_u1, artist: a42)
# UserArtist.create(user: grunge_u1, artist: a43)
# UserArtist.create(user: grunge_u1, artist: a44)
# UserArtist.create(user: grunge_u1, artist: a45)
# UserArtist.create(user: grunge_u1, artist: a46)
# UserArtist.create(user: grunge_u1, artist: a47)
# UserArtist.create(user: grunge_u1, artist: a48)
# UserArtist.create(user: grunge_u1, artist: a49)
# UserArtist.create(user: grunge_u1, artist: a410)

# #profile: electronic fan
# a51 = add_artistgenre_seed("Aphex Twin")
# a52 = add_artistgenre_seed("BTS")
# a53 = add_artistgenre_seed("Skrillex")
# a54 = add_artistgenre_seed("Tygo")
# a55  = add_artistgenre_seed("Oneohtrix Point Never")
# a56 = add_artistgenre_seed("Ryuichi Sakamoto")
# a57  = add_artistgenre_seed("Yellow Magic Orchestra")
# a58  = add_artistgenre_seed("Kanye West")
# a59 = add_artistgenre_seed("MF DOOM")
# a510 = add_artistgenre_seed("J Dilla")
# electronic_u1 = User.create(name:"leslie", age: 23, city: "NYC", email: "leslieemail")
# UserArtist.create(user: electronic_u1, artist: a51)
# UserArtist.create(user: electronic_u1, artist: a52)
# UserArtist.create(user: electronic_u1, artist: a53)
# UserArtist.create(user: electronic_u1, artist: a54)
# UserArtist.create(user: electronic_u1, artist: a55)
# UserArtist.create(user: electronic_u1, artist: a56)
# UserArtist.create(user: electronic_u1, artist: a57)
# UserArtist.create(user: electronic_u1, artist: a58)
# UserArtist.create(user: electronic_u1, artist: a59)
# UserArtist.create(user: electronic_u1, artist: a510)

# #profile: hiphop/pop fans
# hip_hop_pop_u1 = User.create(name: "chrys", age: 97, city: "NJ", email: "chrysemail")
# UserArtist.create(user: hip_hop_pop_u1, artist: a21)
# UserArtist.create(user: hip_hop_pop_u1, artist: a22)
# UserArtist.create(user: hip_hop_pop_u1, artist: a23)
# UserArtist.create(user: hip_hop_pop_u1, artist: a24)
# UserArtist.create(user: hip_hop_pop_u1, artist: a25)
# UserArtist.create(user: hip_hop_pop_u1, artist: a36)
# UserArtist.create(user: hip_hop_pop_u1, artist: a37)
# UserArtist.create(user: hip_hop_pop_u1, artist: a38)
# UserArtist.create(user: hip_hop_pop_u1, artist: a39)
# UserArtist.create(user: hip_hop_pop_u1, artist: a310)

# hip_hop_pop_u2 = User.create(name: "jess", age: 92, city: "Connecticut", email: "jessemail")
# UserArtist.create(user: hip_hop_pop_u2, artist: a31)
# UserArtist.create(user: hip_hop_pop_u2, artist: a32)
# UserArtist.create(user: hip_hop_pop_u2, artist: a33)
# UserArtist.create(user: hip_hop_pop_u2, artist: a34)
# UserArtist.create(user: hip_hop_pop_u2, artist: a35)
# UserArtist.create(user: hip_hop_pop_u2, artist: a26)
# UserArtist.create(user: hip_hop_pop_u2, artist: a27)
# UserArtist.create(user: hip_hop_pop_u2, artist: a28)
# UserArtist.create(user: hip_hop_pop_u2, artist: a29)
# UserArtist.create(user: hip_hop_pop_u2, artist: a210)


#artist seeds
# artist1 = Artist.create(name: "The Beatles", popularity: 30)
# artist2 = Artist.create(name: "Beyonce", popularity: 20)
# artist3 = Artist.create(name: "Vampire Weekend", popularity: 80)
# artist4 = Artist.create(name: "Drake", popularity: 70)
# artist5 = Artist.create(name: "Father John Misty", popularity: 150)
# artist6 = Artist.create(name: "Lizzo", popularity: 50)
# artist7 = Artist.create(name: "Arctic Monkeys", popularity: 75)
# artist8 = Artist.create(name: "Tame Impala", popularity: 90)
# artist9 = Artist.create(name: "Rihanna", popularity: 45)
# artist10 = Artist.create(name: "The Strokes", popularity: 125)
# artist11 = Artist.create(name: "Bon Iver", popularity: 140)
# artist12 = Artist.create(name: "Courtney Barnett", popularity: 180)
# artist13 = Artist.create(name: "Kanye West", popularity: 25)
# artist14 = Artist.create(name: "Phoebe Bridgers", popularity: 250)
# artist15 = Artist.create(name: "The Grateful Dead", popularity: 200)
# artist16 = Artist.create(name:"Nirvana",popularity: 80)
# artist17 = Artist.create(name: "Disturbed",popularity: 20)
# artist18 = Artist.create(name:"Ice Cube",popularity: 60)


# #user seeds
# user1 = User.create(name: "Eli", city: "Brooklyn", age: 28, email: "eliemail")
# user2 = User.create(name: "Jeff", city: "Brooklyn", age: 30, email: "jeffemail")
# user3 = User.create(name: "Luis", city: "NYC", age: 28, email: "luisemail")
# user4 = User.create(name: "Chiara", city: "Brooklyn", age: 27, email: "ccemail")
# user5 = User.create(name: "Tashawn", city: "LA", age: 32, email: "temail")
# user6 = User.create(name: "Caryn", city: "NYC", age: 30, email: "caemail")
# user7 = User.create(name: "Lisa", age: 20, city: "Brick City", email: "u1@gmail.com")
# user8 = User.create(name: "Bill", age: 20, city: "Mars", email: "u2@gmail.com")


# #userartists seeds
# userartist1 = UserArtist.create(user: user1, artist: artist5)
# userartist2 = UserArtist.create(user: user1, artist: artist15)
# userartist3 = UserArtist.create(user: user1, artist: artist8)
# userartist4 = UserArtist.create(user: user1, artist: artist13)
# userartist5 = UserArtist.create(user: user2, artist: artist1)
# userartist6 = UserArtist.create(user: user2, artist: artist2)
# userartist7 = UserArtist.create(user: user2, artist: artist3)
# userartist8 = UserArtist.create(user: user2, artist: artist5)
# userartist9 = UserArtist.create(user: user3, artist: artist15)
# userartist10 = UserArtist.create(user: user3, artist: artist3)
# userartist11 = UserArtist.create(user: user3, artist: artist10)
# userartist12 = UserArtist.create(user: user3, artist: artist14)
# userartist13 = UserArtist.create(user: user4, artist: artist9)
# userartist14 = UserArtist.create(user: user4, artist: artist8)
# userartist15 = UserArtist.create(user: user4, artist: artist1)
# userartist16 = UserArtist.create(user: user4, artist: artist7)
# userartist17 = UserArtist.create(user: user5, artist: artist4)
# userartist18 = UserArtist.create(user: user5, artist: artist5)
# userartist19 = UserArtist.create(user: user5, artist: artist11)
# userartist20 = UserArtist.create(user: user5, artist: artist12)
# userartist21 = UserArtist.create(user: user6, artist: artist6)
# userartist22 = UserArtist.create(user: user6, artist: artist3)
# userartist23 = UserArtist.create(user: user6, artist: artist13)
# userartist24 = UserArtist.create(user: user6, artist: artist14)
# userartist24 = UserArtist.create(user: user7,artist: artist1)
# userartist25 = UserArtist.create(user: user8,artist: artist2)
# userartist26 = UserArtist.create(user: user8,artist: artist3)


# #genre seeds
# genre1 = Genre.create(name: "Rock")
# genre2 = Genre.create(name: "Rap")
# genre3 = Genre.create(name: "R&B")
# genre4 = Genre.create(name: "Country")
# genre5 = Genre.create(name: "Pop")
# genre6 = Genre.create(name: "Singer/Songwriter")
# genre7 = Genre.create(name: "Indie")
# genre8 = Genre.create(name: "Indie Rock")
# genre9 = Genre.create(name: "Garage Rock")
# genre10 = Genre.create(name: "Jam")
# genre11 = Genre.create(name: "Psychedlic Rock")

# #artistgenre seeds
# artistgenre1 = ArtistGenre.create(artist: artist1, genre: genre1)
# artistgenre2 = ArtistGenre.create(artist: artist1, genre: genre11)
# artistgenre3 = ArtistGenre.create(artist: artist2, genre: genre3)
# artistgenre4 = ArtistGenre.create(artist: artist2, genre: genre5)
# artistgenre5 = ArtistGenre.create(artist: artist3, genre: genre1)
# artistgenre6 = ArtistGenre.create(artist: artist3, genre: genre7)
# artistgenre7 = ArtistGenre.create(artist: artist3, genre: genre8)
# artistgenre8 = ArtistGenre.create(artist: artist4, genre: genre2)
# artistgenre9 = ArtistGenre.create(artist: artist4, genre: genre3)
# artistgenre10 = ArtistGenre.create(artist: artist4, genre: genre5)
# artistgenre11 = ArtistGenre.create(artist: artist5, genre: genre1)
# artistgenre12 = ArtistGenre.create(artist: artist5, genre: genre4)
# artistgenre13 = ArtistGenre.create(artist: artist5, genre: genre6)
# artistgenre14 = ArtistGenre.create(artist: artist6, genre: genre2)
# artistgenre15 = ArtistGenre.create(artist: artist6, genre: genre3)
# artistgenre16 = ArtistGenre.create(artist: artist6, genre: genre4)
# artistgenre17 = ArtistGenre.create(artist: artist7, genre: genre1)
# artistgenre18 = ArtistGenre.create(artist: artist7, genre: genre7)
# artistgenre19 = ArtistGenre.create(artist: artist7, genre: genre8)
# artistgenre20 = ArtistGenre.create(artist: artist7, genre: genre9)
# artistgenre21 = ArtistGenre.create(artist: artist8, genre: genre1)
# artistgenre22 = ArtistGenre.create(artist: artist8, genre: genre8)
# artistgenre23 = ArtistGenre.create(artist: artist8, genre: genre9)
# artistgenre24 = ArtistGenre.create(artist: artist8, genre: genre11)
# artistgenre25 = ArtistGenre.create(artist: artist9, genre: genre3)
# artistgenre26 = ArtistGenre.create(artist: artist9, genre: genre5)
# artistgenre27 = ArtistGenre.create(artist: artist10, genre: genre1)
# artistgenre28 = ArtistGenre.create(artist: artist10, genre: genre7)
# artistgenre29 = ArtistGenre.create(artist: artist10, genre: genre8)
# artistgenre30 = ArtistGenre.create(artist: artist10, genre: genre9)
# artistgenre31 = ArtistGenre.create(artist: artist11, genre: genre4)
# artistgenre32 = ArtistGenre.create(artist: artist11, genre: genre6)
# artistgenre33 = ArtistGenre.create(artist: artist11, genre: genre11)
# artistgenre34 = ArtistGenre.create(artist: artist12, genre: genre1)
# artistgenre35 = ArtistGenre.create(artist: artist12, genre: genre6)
# artistgenre36 = ArtistGenre.create(artist: artist12, genre: genre9)
# artistgenre37 = ArtistGenre.create(artist: artist13, genre: genre2)
# artistgenre38 = ArtistGenre.create(artist: artist13, genre: genre3)
# artistgenre39 = ArtistGenre.create(artist: artist13, genre: genre5)
# artistgenre40 = ArtistGenre.create(artist: artist14, genre: genre4)
# artistgenre41 = ArtistGenre.create(artist: artist14, genre: genre6)
# artistgenre42 = ArtistGenre.create(artist: artist14, genre: genre7)
# artistgenre43 = ArtistGenre.create(artist: artist15, genre: genre1)
# artistgenre44 = ArtistGenre.create(artist: artist15, genre: genre10)
# artistgenre45 = ArtistGenre.create(artist: artist15, genre: genre11)


# #connections
# connection1 = Connection.create(connector: user1 , connectee: user2, strength: 7.5)
# connection2 = Connection.create(connector: user1 , connectee: user4, strength: 6.3)
# connection3 = Connection.create(connector: user2 , connectee: user6, strength: 9.2)
# connection4 = Connection.create(connector: user3 , connectee: user1, strength: 7.3)
# connection5 = Connection.create(connector: user4 , connectee: user5, strength: 5.4)
# connection6 = Connection.create(connector: user5 , connectee: user3, strength: 8.1)
# connection7 = Connection.create(connector: user3 , connectee: user5, strength: 8.1)


# #rejections
# rejection1 = Rejection.create(rejector: user1, rejectee: user5, strength: 3.2)
# rejection2 = Rejection.create(rejector: user2, rejectee: user1, strength: 7.5)
# rejection3 = Rejection.create(rejector: user4, rejectee: user3, strength: 4.1)
# rejection4 = Rejection.create(rejector: user3, rejectee: user2, strength: 1.1)
# rejection5 = Rejection.create(rejector: user5, rejectee: user6, strength: 2.7)
# rejection6 = Rejection.create(rejector: user6, rejectee: user1, strength: 4.0)


#User.well_connected

 #binding.pry