class Portfolio < ApplicationRecord
	#Has to specifically say has_many if it is a one to many
	has_many :technologies, dependent: :destroy
	accepts_nested_attributes_for :technologies,
								   allow_destroy: true,
								   reject_if: lambda { |attrs| attrs["name"].blank? }

	#portfolios cannot be created unless they hve these parameters
	validates_presence_of :title, :body

	mount_uploader :thumb_image, PortfolioUploader
	mount_uploader :main_image, PortfolioUploader

	#allows you to separate routes by subtitle or in later cases, ids
	def self.react
		where(subtitle: "React")
	end

	def self.by_position
		order("position ASC")
	end

	scope :ruby, -> {where(subtitle: "Ruby on Rails")}
end
