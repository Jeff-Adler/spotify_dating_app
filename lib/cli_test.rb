require 'rspotify'
require 'pry'
require_relative '../config/environment'
require_relative '../app/models/user.rb'
require_relative '../app/models/artist.rb'
require_relative '../app/models/user_artist.rb'
# require 'tty-prompt'
# prompt = TTY::Prompt.new

# User.destroy_all
# Artist.destroy_all

def help
    puts "Options:"
    puts "'welcome' - restarts prompts"
    puts "'clear' - quits prompt"
    puts "'new_user' - creates account for new user"
    puts "'returning_user' - log-in for returning users"
    puts "'choose_artist' - add artist to list of favorites"
    puts "'help' - return all options"
end


def choose_artist(nu)
   puts "Choose an artist you'd like to add to your favorites list:"
   artist = gets.chomp.to_s
   ao = RSpotify::Artist.search(artist)
  
    puts "Confirming choice #{ao.first.name} (y/n)?"
    answer = gets.chomp.to_s

    if answer == "n"
        choose_artist(nu)
    elsif answer == "y"
        na = Artist.create(name: ao.first.name, popularity: ao.first.popularity)
        UserArtist.create(user: nu, artist: na)
    else
        puts "Invalid answer. Try again."
        choose_artist(nu)
    end
    
end

def new_user
    puts "What's your name?"
    n = gets.chomp.to_s
    puts "What's your age?"
    a = gets.chomp.to_i
    puts "What's your city?"
    c = gets.chomp.to_s
    puts "What's your email?"
    e = gets.chomp

    nu = User.create(name: n, age: a, city: c, email: e)
    puts "Your account was successfully created #{nu.name}!"
    choose_artist(nu)
end

def returning_user (email)
    ru = User.all.select {|u| u.email == email}
        if ru != email
            welcome
        else
            puts "Nice to see you again #{ru}!"
            choose_artist(ru)
        end
    #choose connections?
end


def user_status (us)
    if us == "n"
        puts "Welcome back! Please enter your email to log-in."
        email = gets.chomp.to_s
        returning_user(email)
    elsif us == "y"
        puts "Fantastic!"
        new_user
    else
        puts "Error. Invalid response, try again."
        welcome
    end
end

def welcome
    puts "Welcome to the Spotify Dating App!"
    puts "If you need help at any time, simply type 'help' into the console."
    puts "Are you a new user? (y/n)"
    us = gets.chomp.to_s
    user_status(us)
end


#choose_artist
#new_user

#welcome





#binding.pry