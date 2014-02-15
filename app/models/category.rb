class Category < ActiveRecord::Base
  has_many :posts
  #attr_accessor :status
end
