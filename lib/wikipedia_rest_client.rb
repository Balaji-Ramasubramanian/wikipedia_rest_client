require "wikipedia_rest_client/version"
require "wikipedia_rest_client/utils"
require "wikipedia_rest_client/page"
require "wikipedia_rest_client/featured_article"
require "wikipedia_rest_client/image_of_the_day"

require 'httparty'
require 'json'
require 'date'
require 'uri'

module WikipediaRestClient
  

	def self.get_page(title)
		title = URI::encode(title)
		page_url = BASE_URL + PAGE_URL + title
		page_response = HTTParty.get(page_url)
		page = Page.new(page_response)
		page
	end

	def self.get_random
		random_url = BASE_URL + RANDOM_PAGE_URL
		random_page_response = JSON.parse(HTTParty.get(random_url))
		random_title = random_page_response["uri"].gsub("/en.wikipedia.org/v1/page/random/../summary/","")
		random_page = get_page(random_title)
		random_page

	end

	def self.get_featured_article( date = Time.now.strftime("%Y/%m/%d") )
		url = BASE_URL + FEATURED_ARTICLE + date
		response = HTTParty.get(url)
		article = FeaturedArticle.new.featured_article(response)
		page = Page.new(article)
		page
	end

	def self.get_image_of_the_day(date = Time.now.strftime("%Y/%m/%d") )
		url = BASE_URL + FEATURED_ARTICLE + date
		response = HTTParty.get(url)
		image = ImageOfTheDay.new(response)
		image
	end

end
