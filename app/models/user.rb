class User < ActiveRecord::Base
    has_secure_password
    has_many :cars
    #has_one :garage
    
    validates :email, uniqueness: true
    validates :name, uniqueness: true
    validates :email, presence: true
    validates :name, presence: true

    def slug
        #binding.pry
        self.name.gsub(" ", "-").downcase
      end
    
      def self.find_by_slug(slug)
        name = slug.gsub("-", " ").titleize
        User.all.find{|p| p.slug == slug}
          #binding.pry
      end

end