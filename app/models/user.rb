class User < ActiveRecord::Base
    has_many :Cars 
    has_many :Countries
    has_many :Languages
    has_many :Markets

end