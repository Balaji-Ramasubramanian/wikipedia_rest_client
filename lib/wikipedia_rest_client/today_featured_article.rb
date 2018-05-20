module WikipediaRestClient

	class TodayFeaturedArticle

		def today_featured_article(json)
			@data = json
			if @data["tfa"]
				then 
				@data["tfa"]
			end
		end

		def image_of_the_day
			@data["image"]["image"]["source"]
		end
		
	end


end


