class Producer < ActiveRecord::Base
	resourcify
	validates :name, presence: true
end
