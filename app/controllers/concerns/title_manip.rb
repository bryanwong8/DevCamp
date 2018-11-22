module TitleManip
	extend ActiveSupport::Concern

	included do 
		before_action :set_title
	end

	def set_title
		@page_title = "Devcamp Portfolio | My Portfolio Website"
		@seo_keywords = "Blah blah"
	end
end