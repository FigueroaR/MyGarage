class CarController < ApplicationController 
    
    get '/garage' do 
        @car = Car.all
        erb :"users/garage"
    end
    
    get '/sessions/car/:id' do
        
        @car = Car.find_by(id: params[:id])      
         #binding.pry
        if @car
           erb :'users/show'
        else 
           redirect '/garage'
        end 
     end

    #create new car
    get '/sessions/new/car' do 
        erb :'registrations/newcar'
    end

    #save new car / then go home
    post '/new/car' do 
        @car = Car.new(make: params["make"], model: params["model"], year: params["year"])
        @car.save
        session[:car_id] = @car.id
        #puts params
        redirect '/users/home'
    end

    #iterate through my garage
    post 'sessions/car/:id' do 
        @car = Car.find_by(id: params[:car_id])
        if @car.save
            redirect "/sessions/car/#{@car.id}" 
        else 
            redirect '/users/home'
        end
    end

    post '/car/:id' do 
        @car = Car.find_by(id: params[:id])
        if @car.destroy
          redirect "/garage"
        else
          redirect "/users/home"
        end
    end

end