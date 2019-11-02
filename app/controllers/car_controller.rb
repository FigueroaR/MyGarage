class CarController < ApplicationController 
    
    get '/garage' do 
        @car = Car.all
        erb :"users/garage"
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
    get 'sessions/car/:id' do 
        @car = Car.find_by(id: params[:car_id])
        if @car 
            erb :'users/garage' 
        else
            redirect "/users/home"
        end
    end

    post 'sessions/car/:id' do 
        @car = Car.new(params)
        if @car.save 
            redirect "sessions/car/#{@car.id}"
        else 
            redirect '/users/home'
        end
    end



end