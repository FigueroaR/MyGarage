require 'pry'
class UserController < ApplicationController

    get '/login' do 
        #binding.pry
        erb :'sessions/login'
    end

    post '/login' do 
        @user = User.find_by(email: params[:email])
        #binding.pry
        if @user != nil && @user.authenticate(params[:password]) 
            # set our sesssion hash and redirect accordingly
            session[:user_id] = @user.id
            redirect '/users/home'
        else 
            redirect '/sessions/login'
        end 
    end

    get '/signup' do 
        erb :"registrations/signup"
    end

    post '/signup' do 
        #binding.pry
        @user = User.new(name: params["name"], email: params["email"], password: params["password"])
        @user.save
        session[:user_id] = @user.id
        redirect '/users/home'
    end

    

    get '/users/home' do 
        #binding.pry
        @user = current_user
        erb :'users/home'
    end

    get '/logout' do 
        session.clear
        redirect '/'
    end

end 