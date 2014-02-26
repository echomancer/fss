class Unit < ActiveRecord::Base
	extend FriendlyId
  	friendly_id :name, use: :slugged
	resourcify
	validates :name, presence: true
end
