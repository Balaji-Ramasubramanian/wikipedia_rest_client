require 'nokogiri'
module WikipediaRestClient

	# @author Balaji
	class ImageOfTheDay

		# Returns
		def initialize(json)
			@data = json["image"]
		end

		# Returns the tile of ImageOfTheDay
		def title
			@data["title"]
		end

		# Returns the URL of the image
		def image_url
			@data["image"]["source"]
		end

		# Returns width of the image
		def image_width
			@data["image"]["width"]
		end

		# Returns height of the image
		def image_height
			@data["image"]["height"]
		end

		# Returns the source of the thumbnail image
		def thumbnail
			@data["thumbnail"]["source"]
		end

		# Returns width of thumbnail
		def thumbnail_width
			@data["thumbnail"]["width"]
		end

		# Returns height of thumbnail
		def thumbnail_height
			@data["thumbnail"]["height"]
		end

		# Returns description about the image
		def description_text
			html_data = @data["description"]["text"]
			parsed_data = Nokogiri::HTML(html_data)
			parsed_data.text
		end

	end

end