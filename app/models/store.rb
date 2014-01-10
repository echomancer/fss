class Store < ActiveRecord::Base
	resourcify
	validates :name, presence: true
end
