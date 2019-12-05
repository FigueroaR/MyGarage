class CarController < ApplicationController 
    
    get '/garage' do 
        if logged_in?
            @user = current_user
            erb :"cars/garage"
        else 
            redirect '/login'
        end
    end
    
    
    #create new car
    get '/new/cars' do 
        if logged_in?
            erb :'cars/new'
        else
            redirect '/login'
        end
    end

    #save new car / then go to car ID
    post '/cars' do 
        if logged_in?
            @car = current_user.cars.build(make: params["make"], model: params["model"], year: params["year"])
            if params["make"] == "" || params["model"] =="" || params["year"] == ""
                redirect '/new/cars'
            else
                @car.save
                redirect "/cars/#{@car.id}"
            end
        else 
            redirect '/login'
        end 
    end

    get '/cars/:id' do 
        if logged_in?
            @car = Car.find_by_id(params[:id])
            @user = @car.user
            if @car.user_id == current_user.id
                erb :'cars/car'
            else 
                erb :'cars/show'
            end
        else 
            redirect '/login'
        end 
    end

    get '/cars/:id/edit' do 
        if logged_in?
            @car = current_user.cars.find_by(id: params[:id])
            if @car.user_id == current_user.id
                erb :"cars/edit"
            else
                redirect "/users/home"
            end
        else
            redirect '/login'
        end
    end

    patch '/cars/:id' do 
        if logged_in?
            @car = current_user.cars.find_by(id: params[:id])
            if params["make"] == "" || params["model"] =="" || params["year"] == ""
                redirect "/cars/#{@car.id}/edit"
            else
                @car.update(make: params[:make], model: params[:model], year: params[:year])
                @car.save
                redirect "/cars/#{@car.id}"
            end
        else 
            redirect '/login'
        end
    end

    delete '/delete/:id' do
        
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

