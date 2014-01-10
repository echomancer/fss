class Unit < ActiveRecord::Base
	resourcify
	validates :name, presence: true
end
