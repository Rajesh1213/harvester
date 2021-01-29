class ScrapeUrl < ApplicationRecord
	include Parser
  	validates :url, presence: true
    has_many :hyper_links
	after_commit :parser_url, on: :create
	

	def parser_url
		self.perform(id)
	end
end
