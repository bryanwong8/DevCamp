class Blog < ApplicationRecord
	enum status: { draft: 0, published: 1 }
	extend FriendlyId
	friendly_id :title, use: :slugged

	validates_presence_of :title, :body, :topic_id

	has_many :comments, dependent: :destroy

	#To established a relationship, rails g add_topic_to_blogs topic: references
	#Need to say that each blog belongs to a topic
	belongs_to :topic
end
