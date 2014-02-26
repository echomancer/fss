class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  rolify
  before_create :set_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, :timeoutable

  private
  	def set_default_role
  		self.add_role :user 
  	end
end
