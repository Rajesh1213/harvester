#! /usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'cgi'

module Parser

	POOL_SIZE = 5 #Default pool size I have taken.
	JOBS = Queue.new

	def create_jobs(id)
			scrape_url = ScrapeUrl.where(id: id).first
			if scrape_url.present?
					doc = Nokogiri::HTML(URI.open(scrape_url.url))
					doc.css('a').each do | link |
						logger.info link
						JOBS.push link
					end
			end
			logger.info "Total Jobs #{JOBS.length}"
	end

	def create_hyperlink(url, id)
		HyperLink.transaction do
			hyper_link = HyperLink.where(link: url.to_s, scrape_url_id: id).first
			unless hyper_link.present?
				hyper_link = HyperLink.create!(link: url.to_s, scrape_url_id: id)
			end
			hyper_link
		end
	end

	def create_params(params, hyper_link)
		if params.length > 0
			params.keys.each do |p|
				Parameter.transaction do
					pmt = Parameter.where(param: p.to_s, hyper_link_id: hyper_link.id).first
					unless pmt.present?
						Parameter.create!(param: p.to_s, hyper_link_id: hyper_link.id)
					end
				end
			end
		end
	end

	# THis method will parse the recieved URL link in the arg and call the write a method to write to database ot Spreadsheet.
	def harvest(link, id)
		uri = URI.parse(link['href'])
		row = []
		if uri.is_a?(URI::HTTP) && !uri.host.nil?
			unless uri.query.nil?
				params = CGI.parse(uri.query)
				url1 = URI.join(uri.scheme+"://"+uri.host+uri.path)

				# save hyper link
				hyper_link = create_hyperlink(url1, id)
				# save parameters
				create_params(params, hyper_link)
			end
		end
	end

	def perform(id)
		create_jobs(id)

		workers = POOL_SIZE.times.map do
			#Parse each link and save it to the database. or a file
			Thread.new do
				Rails.application.executor.wrap do
					ActiveRecord::Base.connection_pool.with_connection do
						until JOBS.empty?
							logger.info "Starting Thread #{Thread.current.object_id.to_s}"
							begin
								while link = JOBS.pop(true) rescue nil
									harvest(link, id) if link
								end
							rescue ThreadError => e
								logger.error(e.inspect)
							end
						end
					end
				end
			end
		end

		logger.info workers

		workers.map(&:join)

		logger.info workers
		logger.info "Total Jobs #{JOBS.length}"
	end
end

# p = Parser.new
# p.initiate_parse
