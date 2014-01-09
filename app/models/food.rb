class Food < ActiveRecord::Base
  belongs_to :producer
  belongs_to :unit
end
