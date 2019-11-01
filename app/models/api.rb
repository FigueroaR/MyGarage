class API

    def self.get_mercedez
        url = "https://api.mercedes-benz.com/configurator/v1/markets?apikey=8e652f8e-6559-4088-b946-d929b9663f2b"
        resp = RestClient.get(url)
        
        mercedez_hash = JSON.parse(resp.body)
        #mercedez_hash
        #binding.pry
    end

end