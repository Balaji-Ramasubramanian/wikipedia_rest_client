module WikipediaRestClient
	# WikipediaRestClient::Page class
	# @author Balaji
	class Page

		# initialize the data of the Page object
		def initialize(json)
			@data = json
		end

		# Returns the type of the Page
		def type
			@data["type"]
		end

		# Returns the title of the Page
		def title
			@data["title"]
		end

		# Returns the display title of the Page
		def display_title
			@data["displaytitle"]
		end

		# Returns the namepade id of the page
		def namespace_id
			@data["namespace"]["id"]
		end

		# Returns the namespace text
		def namespace_text
			@data["namespace"]["text"]
		end

		# Returns the tile (canonical)
		def titles_canonical
			@data["titles"]["canonical"]
		end

		# Returns the title (normalized)
		def titles_normalized
			@data["titles"]["normalized"]
		end

		# Returns the title (display)
		def titles_display
			@data["titles"]["display"]
		end

		# Returns the pageid of that page
		def pageid
			@data["pageid"]
		end

		# Returns the source of the thumbnail image
		def thumbnail_source
			@data["thumbnail"]["source"]
		end

		# Returns the width of the thumbnail image
		def thumbnail_width
			@data["thumbnail"]["width"]
		end

		# Returns the height of the thumbnail image
		def thumbnail_height
			@data["thumbnail"]["height"]
		end

		# Returns the language of that page
		def lang
			@data["lang"]
		end

		# Returns dir
		def dir
			@data["dir"]
		end

		# Returns revision
		def revision
			@data["revision"]
		end

		# Returns tid
		def tid
			@data["tid"]
		end

		# Returns timestamp
		def timestamp
			@data["timestamp"]
		end

		# Returns description of that page content
		def description
			@data["description"]
		end

		# Returns the url of the main image in the page
		def image_url
			@data["originalimage"]["source"]
		end

		# Returns width of the main image it the page
		def image_width
			@data["originalimage"]["width"]
		end

		# Returns height of the main image it the page
		def image_height
			@data["originalimage"]["height"]
		end

		# Returns page url (desktop)
		def url_desktop_page
			@data["content_urls"]["desktop"]["page"]
		end

		# Returns revision url (desktop)
		def url_desktop_revisions
			@data["content_urls"]["desktop"]["revision"]
		end

		# Returns edit url (desktop)
		def url_desktop_edit
			@data["content_urls"]["desktop"]["edit"]
		end

		# Returns talk url (desktop)
		def url_desktop_talk
			@data["content_urls"]["desktop"]["talk"]
		end

		# Returns page url (mobile)
		def url_mobile_page
			@data["content_urls"]["mobile"]["page"]
		end

		# Returns revision url (mobile)
		def url_mobile_revisions
			@data["content_urls"]["mobile"]["revision"]
		end

		# Returns mobile_edit url (mobile)
		def url_mobile_edit
			@data["content_urls"]["mobile"]["edit"]
		end

		# Returns mobile_talk url (mobile)
		def url_mobile_talk
			@data["content_urls"]["mobile"]["talk"]
		end

		# Returns summary url
		def api_urls_summary
			@data["api_urls"]["summary"]
		end

		# Returns metadata url
		def api_urls_metadata
			@data["api_urls"]["metadata"]
		end

		# Returns references rul
		def api_urls_references
			@data["api_urls"]["references"]
		end

		# Returns media url
		def api_urls_media
			@data["api_urls"]["media"]
		end

		# Returns edit_html url
		def api_urls_edit_html
			@data["api_urls"]["edit_html"]
		end

		# Returns talk_page_html url
		def api_urls_talk_page_html
			@data["api_urls"]["talk_page_html"]
		end

		# Returns the text of the page
		def text
			@data["extract"]
		end

		# Returns extract_html
		def text_html
			@data["extract_html"]
		end

		# Returns normalized title
		def normalized_title
			@data["normalizedtitle"]
		end

		# Returns page url (desktop)
		def url
			@data["content_urls"]["desktop"]["page"]
		end

	end

end