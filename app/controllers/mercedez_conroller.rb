class MercedezController < ApplicationController

    get '/market' do 
        #@market = API.get_mercedez
        erb :'markets/market'
    end 
end