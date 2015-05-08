class Article < ActiveRecord::Base
	belongs_to_many :user
end