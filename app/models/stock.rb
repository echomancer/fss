class Stock < ActiveRecord::Base
  belongs_to :food
  belongs_to :store
  belongs_to :user
end
