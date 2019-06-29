class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


	def active_for_authentication?
	  super && self.status == true # i.e. super && self.is_active
	end

	def inactive_message
	  "Sorry, this account has been deactivated."
	end

end
