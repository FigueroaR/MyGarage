class User < ActiveRecord::Base
    has_many :Cars 
    has_many :Countries
    has_many :Languages
    has_many :Markets
    validates :email, uniqueness: true
    validates :name, uniqueness: true
    validates :email, presence: true
    validates :name, presence: true

end