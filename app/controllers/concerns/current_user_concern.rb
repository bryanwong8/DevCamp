module CurrentUserConcern
	extend ActiveSupport::Concern

	def current_user
		#super keeps the same functionality of the original function
		# if super then let current_user still have the same functionality
		super || guest_user
	end

	def guest_user
		#open struct creates random objects
		OpenStruct.new(name: "Guest User", 
						first_name: "Guest", 
						last_name: "User",
						email: "fnjnjke@gmail.com")
	end
end