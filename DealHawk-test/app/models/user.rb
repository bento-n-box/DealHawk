class User < ActiveRecord::Base
 	attr_accessible :name, :email, :zipcode, :keywords
end
