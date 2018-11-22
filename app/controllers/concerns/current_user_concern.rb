module CurrentUserConcern
	extend ActiveSupport::Concern

	def current_user
		#super keeps the same functionality of the original function
		super || guest_user
	end

	def guest_user
		OpenStruct.new(name: "Guest User", 
						first_name: "Guest", 
						last_name: "User",
						email: "fnjnjke@gmail.com")
	end
end