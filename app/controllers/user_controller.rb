require 'pry'
class UserController < ApplicationController

    get '/login' do 
        erb :welcome
    end

    get '/registrations/signup' do 
        erb :"registrations/signup"
    end

    post '/registrations' do 
        #binding.pry
        @user = User.new(name: params["name"], email: params["email"], password: params["password"])
        @user.save
        session[:user_id] = @user.id
        #puts params
        "hello world "
        redirect '/users/home'
    end

    get '/sessions/login' do 
        erb :"sessions/login"
    end

    post '/sessions' do 
        @user = User.find_by(email: params[:email])
        if @user != nil && @user.password == params[:password] 
            # set our sesssion hash and redirect accordingly
            session[:user_id] = @user.id
            redirect '/users/home'
        else 
            redirect '/sessions/login'
        end 
    end

    get '/sessions/logout' do 
        redirect '/'
    end

    get '/users/home' do 
        @user = User.find_by(id: params[:user_id])
        erb :'users/home'
    end

    get '/sessions/new/car' do 
        erb :'registrations/newcar'
    end

    post '/new/car' do 
        @car = Car.new(make: params["make"], model: params["model"], year: params["year"])
        @car.save
        session[:car_id] = @car.id
        #puts params
        redirect '/users/home'
    end
end 