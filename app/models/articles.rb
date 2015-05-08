class Article < ActiveRecord::Base
	belongs_to_many :artists
end