class Stock < ActiveRecord::Base
	resourcify
	belongs_to :food
	belongs_to :store
	belongs_to :user
end
