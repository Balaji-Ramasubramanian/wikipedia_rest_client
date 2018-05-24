module WikipediaRestClient

	class FeaturedArticle

		# Today's Featured Article from Wikipedia page.
		def featured_article(json)
			@data = json
			if @data["tfa"]
				then 
				@data["tfa"]
			end
		end

		# Image of the day content from Wikipedia page.
		def image_of_the_day
			@data["image"]["image"]["source"]
		end
		
	end


end


