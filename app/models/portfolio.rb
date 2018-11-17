class Portfolio < ApplicationRecord
	has_many :technologies
	include Placeholder
	#portfolios cannot be created unless they hve these parameters
	validates_presence_of :title, :body, :main_image, :thumb_image

	#allows you to separate routes by subtitle or in later cases, ids
	def self.react
		where(subtitle: "React")
	end

	scope :ruby, -> {where(subtitle: "Ruby on Rails")}

	after_initialize :set_defaults

	def set_defaults
		#self = this
		self.main_image ||= Placeholder.image_generator(height: "600", width: "400")
		self.thumb_image ||= Placeholder.image_generator(height: "350", width: "200")
	end
end
