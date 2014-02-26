class Stock < ActiveRecord::Base
	extend FriendlyId
  	friendly_id :display_name, use: :slugged
	resourcify
	belongs_to :food
	belongs_to :store
	belongs_to :user

	def display_name
		"#{food.name} #{store.name} #{user.name} #{self.created_at}"
	end
end
