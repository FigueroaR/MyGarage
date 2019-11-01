require 'pry'
class UserController < ApplicationController

    get '/login' do 
        erb :welcome
    end

    get '/registrations/signup' do 
        erb :"registrations/signup"
    end

    post '/resgistrations' do 
        #binding.pry
        #@user = User.new(name: params["name"], email: params["email"], password: params["password"])
        #@user.save
        #session[:user_id] = @user.id
        #puts params
        "hello world "
        #redirect '/users/home'
    end

    get '/sessions/login' do 
        erb :"sessions/login"
    end

    post '/sessions' do 

    end

    get '/sessions/logout' do 
        redirect '/'
    end

    get '/users/home' do 
        erb :'users/home'
    end

end 