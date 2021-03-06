require 'pry'
class UserController < ApplicationController

    
    get '/login' do 
        #binding.pry
        if logged_in?
            redirect '/users/home'
        else
            erb :'sessions/login'
        end
    end

    post '/login' do 
        #binding.pry
        if !logged_in?
            @user = User.find_by(email: params[:email])
        #binding.pry
            if @user != nil && @user.authenticate(params[:password]) 
                # set our sesssion hash and redirect accordingly
                session[:user_id] = @user.id
                redirect '/users/home'
            else 
                redirect '/login'
            end 
        else 
            '/users/home'
        end
    end

    get '/signup' do 
        #
        if logged_in?
            redirect '/users/home'
        else 
            erb :"registrations/signup"
        end
    end

    post '/signup' do 
        #binding.pry
        if logged_in? 
            redirect '/users/home'
        else 
            @user = User.new(name: params["name"], email: params["email"], password: params["password"])
            @user.save
            session[:user_id] = @user.id
            redirect '/users/home'
        end
    end

    

    get '/users/home' do 
        #binding.pry
        if logged_in? 
            @user = current_user
            erb :'users/home'
        else
            redirect '/login'
        end
    end

    get '/users/:slug' do 
        #binding.pry
        @user = User.find_by_slug(params[:slug])
        erb :'cars/theirgarage'
    end 

    get '/loggedout' do 
        if logged_in?
            session.clear
            redirect '/'
        else 
            redirect '/login'
        end
    end

    get '/logout' do 
        if logged_in?
            erb :"/sessions/logout"
        else 
            redirect '/login'
        end
    end
    

end 