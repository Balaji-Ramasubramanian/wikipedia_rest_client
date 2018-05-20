module WikipediaRestClient

	class Page

		def initialize(json)
			@data = json
		end

		def type
			@data["type"]
		end

		def title
			@data["title"]
		end

		def display_title
			@data["displaytitle"]
		end

		def namespace_id
			@data["namespace"]["id"]
		end

		def namespace_text
			@data["namespace"]["text"]
		end

		def titles_canonical
			@data["titles"]["canonical"]
		end

		def titles_normalized
			@data["titles"]["normalized"]
		end

		def titles_display
			@data["titles"]["display"]
		end

		def pageid
			@data["pageid"]
		end

		def thumbnail_source
			@data["thumbnail"]["source"]
		end

		def thumbnail_width
			@data["thumbnail"]["width"]
		end

		def thumbnail_height
			@data["thumbnail"]["height"]
		end

		def lang
			@data["lang"]
		end

		def dir
			@data["dir"]
		end

		def revision
			@data["revision"]
		end

		def tid
			@data["tid"]
		end

		def timestamp
			@data["timestamp"]
		end

		def description
			@data["description"]
		end

		def image_url
			@data["originalimage"]["source"]
		end

		def image_width
			@data["originalimage"]["width"]
		end

		def image_height
			@data["originalimage"]["height"]
		end

		def url_desktop_page
			@data["content_urls"]["desktop"]["page"]
		end

		def url_desktop_revisions
			@data["content_urls"]["desktop"]["revision"]
		end

		def url_desktop_edit
			@data["content_urls"]["desktop"]["edit"]
		end

		def url_desktop_talk
			@data["content_urls"]["desktop"]["talk"]
		end

		def url_mobile_page
			@data["content_urls"]["mobile"]["page"]
		end

		def url_mobile_revisions
			@data["content_urls"]["mobile"]["revision"]
		end

		def url_mobile_edit
			@data["content_urls"]["mobile"]["edit"]
		end

		def url_mobile_talk
			@data["content_urls"]["mobile"]["talk"]
		end

		def api_urls_summary
			@data["api_urls"]["summary"]
		end

		def api_urls_metadata
			@data["api_urls"]["metadata"]
		end

		def api_urls_references
			@data["api_urls"]["references"]
		end

		def api_urls_media
			@data["api_urls"]["media"]
		end

		def api_urls_edit_html
			@data["api_urls"]["edit_html"]
		end

		def api_urls_talk_page_html
			@data["api_urls"]["talk_page_html"]
		end

		def text
			@data["extract"]
		end

		def text_html
			@data["extract_html"]
		end

		def normalized_title
			@data["normalizedtitle"]
		end

		def url
			@data["content_urls"]["desktop"]["page"]
		end

	end

end