class CarController < ApplicationController 
    
    get '/garage' do 
        @user = current_user
        erb :"users/garage"
    end
    
     #iterate through my garage
     get '/car/:id' do 
        #binding.pry
        @car = Car.find_by_id(params[:id])
        if @car.user_id == current_user.id
            erb :'users/car'
        else 
            erb :'car/show'
        end

    end

    #create new car
    get '/new/car' do 
        erb :'car/new_car'
    end

    #save new car / then go home
    post '/car' do 
        #binding.pry
        @car = current_user.cars.new(make: params["make"], model: params["model"], year: params["year"])
        @car.save
        #puts params
        redirect "/car/#{@car.id}"
    end

   

    #post '/car/:id' do 
        #@car = Car.find_by(id: params[:id])
        #if @car.destroy
          #redirect "/garage"
        #else
          #redirect "/users/home"
        #end
    #end
end