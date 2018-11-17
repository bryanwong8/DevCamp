class Portfolio < ApplicationRecord
	validates_presence_of :title, :body, :main_image, :thumb_image

	#allows you to separate routes by subtitle or in later cases, ids
	def self.react
		where(subtitle: "React")
	end

	scope :ruby, -> {where(subtitle: "Ruby on Rails")}

	after_initialize :set_defaults

	def set_defaults
		#self = this
		self.main_image ||= "http://placehold.it/600x400"
		self.thumb_image ||= "http://placehold.it/350x200"
	end
end
