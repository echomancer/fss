class Food < ActiveRecord::Base
	extend FriendlyId
  	friendly_id :display_name, use: :slugged
	resourcify
	belongs_to :producer
	belongs_to :unit
	def display_name
		if servings > 1
			"#{name} (#{servings} #{unit.name.pluralize})"
		else
			"#{name} (#{servings} #{unit.name})"
		end
	end
end
