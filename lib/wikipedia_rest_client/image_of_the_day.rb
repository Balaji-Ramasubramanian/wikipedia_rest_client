module WikipediaRestClient

	class ImageOfTheDay

		def initialize(json)
			@data = json["image"]
		end

		def title
			@data["title"]
		end

		def image_url
			@data["image"]["source"]
		end

		def image_width
			@data["image"]["width"]
		end

		def image_height
			@data["image"]["height"]
		end

		def thumbnail
			@data["thumbnail"]["source"]
		end

		def thumbnail_width
			@data["thumbnail"]["width"]
		end

		def thumbnail_height
			@data["thumbnail"]["height"]
		end

		def description_text
			@data["description"]["text"]
		end

	end

end