class CarController < ApplicationController 
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