class CarController < ApplicationController 
    
    get '/garage' do 
        if logged_in?
            @user = current_user
            erb :"users/garage"
        else 
            redirect '/login'
        end
    end
    
    
    #create new car
    get '/new/car' do 
        if logged_in?
            erb :'car/new_car'
        else
            redirect '/login'
        end
    end

    #save new car / then go to car ID
    post '/car' do 
        #binding.pry
        if logged_in?
            @car = current_user.cars.build(make: params["make"], model: params["model"], year: params["year"])
            if params["make"] == "" || params["model"] =="" || params["year"] == ""
                redirect '/new/car'
            else
                @car.save
                redirect "/car/#{@car.id}"
            end
        else 
            redirect '/login'
        end 
    end

    #iterate through my garage
    get '/car/:id' do 
        #binding.pry
        if logged_in?
            @car = Car.find_by_id(params[:id])
            @user = @car.user
            if @car.user_id == current_user.id
                erb :'users/car'
            else 
                erb :'car/show'
            end
        else 
            redirect '/login'
        end 
    end

    get '/car/:id/edit' do
        #binding.pry 
        if logged_in?
            @car = current_user.cars.find_by(id: params[:id])
            if @car.user_id == current_user.id
                erb :"car/edit_car"
            else
                redirect "/users/home"
            end
        else
            redirect '/login'
        end
    end

    patch '/car/:id' do 
        #binding.pry
        if logged_in?
            @car = current_user.cars.find_by(id: params[:id])
            if params["make"] == "" || params["model"] =="" || params["year"] == ""
                redirect "/car/#{@car.id}/edit"
            else
                @car.update(make: params[:make])
                @car.update(model: params[:model])
                @car.update(year: params[:year])
                @car.save
                redirect "/car/#{@car.id}"
            end
        else 
            redirect '/login'
        end
    end

    delete '/delete/:id' do
        #binding.pry 
        if logged_in? 
            @car = current_user.cars.find_by(id: params[:id])
            if @car.user_id == current_user.id
                @car.delete
                redirect "/garage"
            else 
                redirect 'users/home'
            end 
        else 
            redirect '/login'
        end
    end 
end

