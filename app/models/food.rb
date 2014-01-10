class Food < ActiveRecord::Base
	resourcify
	belongs_to :producer
	belongs_to :unit
end
