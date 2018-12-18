module CurrentUserConcern
	extend ActiveSupport::Concern

	def current_user
		#super keeps the same functionality of the original function
		# if super then let current_user still have the same functionality
		super || guest_user
	end

	def guest_user
		guest = GuestUser.new
		guest.name = "Guest User"
		guest.first_name = "Guest"
		guest.last_name = "User"
		guest.email = "g@example.com"
		guest
	end
end