require "wikipedia_rest_client/version"
require "wikipedia_rest_client/utils"
require "wikipedia_rest_client/page"
require "wikipedia_rest_client/featured_article"
require "wikipedia_rest_client/image_of_the_day"

require 'httparty'
require 'json'
require 'date'
require 'uri'
require 'nokogiri'

# @author Balaji
module WikipediaRestClient
  	# header options to be passed through HTTP requests
  	@@options = {}
	
	# @param username [String] Email address or URLs of contact pages
	# @return [nil]
	# This method will setup the User-Agent header to the HTTP request.
	# Example:
	#
	# WikipediaRestClient.setUserAgent("someone@gmail.com")
	#
	def self.setUserAgent(username)
		@@options = {
			headers: {"User-Agent" => username} #set the User-Agent of the HTTP request header
		}
	end

	# @param title [String] A wikipedia page title that has to be fetched.
	# @return [WikipediaRestClient::Page] WikipediaRestClient::Page object which contains the data about specified title.
	# This method will Return an object that contains the data about the specified Wikipedia page.
	# Example:
	#
	# page = WikipediaRestClient.get_page("Indian President")
  	#Returns an object that contains contents of the required page
	# page.title
 	# => "President of India"
	# page.text
	# => "The President of the Republic of India is the head of state of India and the commander-in-chief of the Indian Armed Forces."
	# page.image_url
	# => "https://upload.wikimedia.org/wikipedia/commons/8/80/Ram_Nath_Kovind_2017.jpg"
	# page.url 
	# => "https://en.wikipedia.org/wiki/President_of_India"
	# page.pageid
	# => 141896
	# page.description
	# => "executive head of state of the Republic of India"
	#
	# The Page class contains the following information,
	#
	# - type
	# - title
	# - display_title
	# - namespace_id
	# - namespace_text
	# - titles_canonical
	# - titles_normalized
	# - titles_display
	# - pageid
	# - thumbnail_source
	# - thumbnail_width   
	# - thumbnail_height
	# - lang
	# - dir
	# - revision
	# - tid
	# - timestamp
	# - description
	# - image_url
	# - image_width
	# - image_height
	# - url_desktop_page
	# - url_desktop_revisions
	# - url_desktop_edit
	# - url_desktop_talk
	# - url_mobile_page
	# - url_mobile_revisions
	# - url_mobile_edit
	# - url_mobile_talk
	# - api_urls_summary
	# - api_urls_metadata
	# - api_urls_references
	# - api_urls_media
	# - api_urls_edit_html
	# - api_urls_talk_page_html
	# - text
	# - text_html
	# - normalized_title
	# - url
	#
	def self.get_page(title)
		title = URI::encode(title)
		page_url = BASE_URL + PAGE_URL + title
		page_response = HTTParty.get(page_url, @@options)
		page = Page.new(page_response)
		page
	end

	# @return [WikipediaRestClient::Page] WikipediaRestClient::Page object which return a random page from Wikipedia.
	# This method will return a random page from Wikipedia.
	# Example:
	# 
	# page = WikipediaRestClient.get_random
	# => Return a random page from wikipedia 
	# page.title
	# => "Adams Glacier (Victoria Land)"
	# page.text
	# => "Adams Glacier is a small glacier immediately south of Miers Glacier in Victoria Land. The heads of Adams and Miers glaciers, both located in the Miers Valley, are separated by a low ridge, and the east end of this ridge is almost completely surrounded by the snouts of the two glaciers, which nearly meet in the bottom of the valley, about 1 mile (1.6 km) above Lake Miers, into which they drain. It was named by the New Zealand Northern Survey Party of the Commonwealth Trans-Antarctic Expedition (1956–58) after Lieutenant Jameson Adams, second in command of the shore party of the British Antarctic Expedition (1907–09), who was one of the men to accompany Ernest Shackleton to within 97 miles (156 km) of the South Pole."
	# page.url
	# => "https://en.wikipedia.org/wiki/Adams_Glacier_(Victoria_Land)"
	# page.pageid
	# => 16524953
	# page.image_url
	# => "https://upload.wikimedia.org/wikipedia/commons/2/24/Antarctica_relief_location_map.jpg"
	#
	def self.get_random
		random_url = BASE_URL + RANDOM_PAGE_URL
		random_page_response = JSON.parse(HTTParty.get(random_url, @@options))
		random_title = random_page_response["uri"].gsub("/en.wikipedia.org/v1/page/random/../summary/","")
		random_page = get_page(random_title)
		random_page

	end

	# @param date [String] The string must be a date in YYYY/MM/DD format. default parameter is current date.
	# @return [WikipediaRestClient::Page] An object of WikipediaRestClient::Page 
	# This method will return the featured article of the specified date from Wikipedia(Default parameter is current date).
	# Example:
	#
	# old_article = WikipediaRestClient.get_featured_article("2018/05/10")
	# => Returns featured article dated (2018/05/10)
	#article.title
	# => "Russian_battleship_Pobeda"
	# article.image_url
	# => "https://upload.wikimedia.org/wikipedia/commons/0/01/Pobeda1904Port-Artur.jpg"
	# article.text
	# => "Pobeda was the last of the three Peresvet-class pre-dreadnought battleships built for the Imperial Russian Navy at the end of the nineteenth century. The ship was assigned to the Pacific Squadron upon completion and based at Port Arthur from 1903. During the Russo-Japanese War of 1904–1905, she participated in the battles of Port Arthur and the Yellow Sea. Having escaped serious damage in these engagements, Pobeda was sunk by gunfire during the Siege of Port Arthur, and then salvaged by the Japanese and placed into service under the name Suwo (周防)."
	# today_article = WikipediaRestClient.get_featured_article
	# => Returns featured article of the current day
	# today_article.title
	# => "Arlington,_Washington"
	# today_article.url
	# => "https://en.wikipedia.org/wiki/Arlington,_Washington"
	# today_article.pageid
	# => 138192
	#
	def self.get_featured_article( date = Time.now.strftime("%Y/%m/%d") )
		url = BASE_URL + FEATURED_ARTICLE + date
		response = HTTParty.get(url, @@options)
		article = FeaturedArticle.new.featured_article(response)
		page = Page.new(article)
		page
	end

	# @param date [String] The string must be a date in YYYY/MM/DD format. default parameter is current date.
	# @return [WikipediaRestClient::IageOfTheDay] An object of WikipediaRestClient::ImageOfTheDay.
	# This method will return 'Image of the day' content of the specified date from Wikipedia(Default parameter is current date).
	# Example:
	#
	# picture_of_the_day = WikipediaRestClient.get_image_of_the_day
	# => Returns pictured of the day
	# picture_of_the_day.title
	# => "File:Haus der Kulturen der Welt, Blaue Stunde, Berlin, 160521, ako.jpg"
	# picture_of_the_day.image_url
	# => "https://upload.wikimedia.org/wikipedia/commons/2/25/Haus_der_Kulturen_der_Welt%2C_Blaue_Stunde%2C_Berlin%2C_160521%2C_ako.jpg"
	# picture_of_the_day.image_height
	# => 3648
	# picture_of_the_day.thumbnail
	# => "https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Haus_der_Kulturen_der_Welt%2C_Blaue_Stunde%2C_Berlin%2C_160521%2C_ako.jpg/640px-Haus_der_Kulturen_der_Welt%2C_Blaue_Stunde%2C_Berlin%2C_160521%2C_ako.jpg"
	# picture_of_the_day_for_a_date = WikipediaRestClient.get_image_of_the_day("2017/03/12")
	# => Returns pictured of the day for the specified date ("YYYY/MM/DD")
	# picture_of_the_day_for_a_date.image_url 
	# => "https://upload.wikimedia.org/wikipedia/commons/4/4b/Cyclosia_papilionaris-Kadavoor-2016-06-17-001.jpg"
	# picture_of_the_day_for_a_date.description_text
	# =>  "<i><a rel=\"mw:WikiLink/Interwiki\" href=\"https://en.wikipedia.org/wiki/Cyclosia%20papilionaris\" title=\"en:Cyclosia papilionaris\">Cyclosia papilionaris</a></i>, Drury's Jewel, is a moth in the <a rel=\"mw:WikiLink/Interwiki\" href=\"https://en.wikipedia.org/wiki/Zygaenidae\" title=\"en:Zygaenidae\">Zygaenidae</a> family. There are many subspecies and this is <i>Cyclosia papilionaris australinda</i> found in <a rel=\"mw:WikiLink/Interwiki\" href=\"https://en.wikipedia.org/wiki/South%20India\" title=\"en:South India\">South India</a>."
	#	
	#
	# It will have the following information,
	#
	# - title
	# - image_url
	# - image_width
	# - image_height
	# - thumbnail
	# - thumbnail_width
	# - thumbnail_height
	# - description_text
	#
	def self.get_image_of_the_day(date = Time.now.strftime("%Y/%m/%d") )
		url = BASE_URL + FEATURED_ARTICLE + date
		response = HTTParty.get(url, @@options)
		image = ImageOfTheDay.new(response)
		image
	end

	# @param date [String] The string must be a date in YYYY/MM/DD format. default parameter is current date.
	# @return [JSON] "on this day" content from Wikipedia. 
	# This method will be used to get the 'On this day' content from Wikipedia. The default paramether is Current date. If you need you can pass date in YYYY/MM/DD format and get the "on this day " cotent for that specified date.
	# Example:
	#
	# on_this_day_content = WikipediaRestClient.get_on_this_day
	# => Returns Array of Hash values which contains 'on this day' contents
	# on_this_day_content[0]["text"]
	# => "A corroded oil pipeline in Santa Barbara County, California, burst, spilling 142,800 U.S. gallons (3,400 barrels) of crude oil onto one of the most biologically diverse coastlines of the U.S. West Coast."
	# on_this_day_content[0]["year"]
	# => 2013
	# on_this_day_content[0]["pages"]
	# => Returns Array of Wikipedia pages related to that topic
	# on_that_day = WikipediaRestClient.get_on_this_day("2018/03/11")
	# => Returns 'on this day' contents for the specified date
	# on_that_day[0]["text"]
	# =>  "United States Army officer Robert Bales murdered sixteen civilians and wounded six others in the Panjwayi District of Kandahar Province, Afghanistan."
	#
	def self.get_on_this_day(date = Time.now.strftime("%Y/%m/%d"))
		url = BASE_URL + FEATURED_ARTICLE + date
		response = HTTParty.get(url, @@options)
		response["onthisday"]
	end

	# @param date [String] The string must be a date in YYYY/MM/DD format. default parameter is current date.
	# @return [JSON] json object that contains news from Wikipedia page.
	# This method will return the list of news that is in the form of JSON object. Each news content will contain news and their related links.
	# Example
	# 
	# news = WikipediaRestClient.get_news
	# => Returns Array of Hash values which contains news contents
	# news[0]["story"]
	# => "Incumbent Nicolás Maduro is re-elected President of Venezuela."
	# news[0]["links"]
	# => Returns Array of link pages related to that news
	#
	def self.get_news(date = Time.now.strftime("%Y/%m/%d"))
		url = BASE_URL + FEATURED_ARTICLE + date
		response = HTTParty.get(url, @@options)
		news = WikipediaRestClient.parsed_news(response["news"])
		news
	end

	# @param date [String] The string must be a date in YYYY/MM/DD format. default parameter is current date.
	# @return [JSON]
	# This method will return the contents of mostread pages and their view counts. 
	# Example
	#
	# most_read = WikipediaRestClient.get_most_read
	# => Returns Hash value
	# most_read["articles"][0]["views"]
	# => 709029
	# most_read["articles"][0]["title"]
	# => "Elizabeth_II"
	# most_read["articles"][0]["extract"]
	# => "Elizabeth II is Queen of the United Kingdom and fifteen other Commonwealth realms."
	# most_read["articles"][0]["content_urls"]["desktop"]["page"]
	# => "https://en.wikipedia.org/wiki/Elizabeth_II"
	#
	def self.get_most_read(date = Time.now.strftime("%Y/%m/%d"))
		url = BASE_URL + FEATURED_ARTICLE + date
		response = HTTParty.get(url, @@options)
		response["mostread"]
	end

	# @param news [json] The json object from the get_news method will be used here.
	# @return [json] Returns the parsed HTML contents inside the json object.
	def self.parsed_news(news)
		news.each do |news|
			data = news["story"]
			parsed_data = Nokogiri::HTML(data)
			news["story"] = parsed_data.text
		end
		news
	end


end
