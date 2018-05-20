# WikipediaRestClient

wikipedia_rest_client is a ruby gem to ease your usage of the Wikipedia REST API. You can find the Wikipedia REST API [here](https://en.wikipedia.org/api/rest_v1/#/). 
By using this gem we can get the following,
- Wikipedia page details for a given topic.
- Featured article.
- Picture of the day.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wikipedia_rest_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wikipedia_rest_client

## Usage

### Page Summary
It will return details of the Wikipedia page for the query string
**Example**
```ruby
page = WikipediaRestClient.get_page("Indian President")
  #Returns an object that contains contents of the required page
page.title
 #=> "President of India"
page.text
 #=> "The President of the Republic of India is the head of state of India and the commander-in-chief of the Indian Armed Forces."
page.image_url
 #=> "https://upload.wikimedia.org/wikipedia/commons/8/80/Ram_Nath_Kovind_2017.jpg"
page.url 
 #=> "https://en.wikipedia.org/wiki/President_of_India"
page.pageid
 #=> 141896
page.description
 #=> "executive head of state of the Republic of India"
```
The Page class contains the following information,
- type
- title
- display_title
- namespace_id
- namespace_text
- titles_canonical
- titles_normalized
- titles_display
- pageid
- thumbnail_source
- thumbnail_width   
- thumbnail_height
- lang
- dir
- revision
- tid
- timestamp
- description
- image_url
- image_width
- image_height
- url_desktop_page
- url_desktop_revisions
- url_desktop_edit
- url_desktop_talk
- url_mobile_page
- url_mobile_revisions
- url_mobile_edit
- url_mobile_talk
- api_urls_summary
- api_urls_metadata
- api_urls_references
- api_urls_media
- api_urls_edit_html
- api_urls_talk_page_html
- text
- text_html
- normalized_title
- url

### Random Article 

**Example**
```ruby
page = WikipediaRestClient.get_random
 #=> Return a random page from wikipedia 
page.title
 #=> "Adams Glacier (Victoria Land)"
page.text
 #=> "Adams Glacier is a small glacier immediately south of Miers Glacier in Victoria Land. The heads of Adams and Miers glaciers, both located in the Miers Valley, are separated by a low ridge, and the east end of this ridge is almost completely surrounded by the snouts of the two glaciers, which nearly meet in the bottom of the valley, about 1 mile (1.6 km) above Lake Miers, into which they drain. It was named by the New Zealand Northern Survey Party of the Commonwealth Trans-Antarctic Expedition (1956–58) after Lieutenant Jameson Adams, second in command of the shore party of the British Antarctic Expedition (1907–09), who was one of the men to accompany Ernest Shackleton to within 97 miles (156 km) of the South Pole."
page.url
 #=> "https://en.wikipedia.org/wiki/Adams_Glacier_(Victoria_Land)"
page.pageid
 #=> 16524953
page.image_url
 #=> "https://upload.wikimedia.org/wikipedia/commons/2/24/Antarctica_relief_location_map.jpg"

```

### Featured Article

Returns the Page object of the featured article

```ruby
article_of_the_day = WikipediaRestClient.get_featured_article
#=> Returns today's featured article

article = WikipediaRestClient.get_featured_article(<DATE>) #Date Should be in YYYY/MM/DD Format
#=> Returns featured article for the specified date
```


**Example**
```ruby
old_article = WikipediaRestClient.get_featured_article("2018/05/10")
#=> Returns featured article dated (2018/05/10)
article.title
#=> "Russian_battleship_Pobeda"
article.image_url
#=> "https://upload.wikimedia.org/wikipedia/commons/0/01/Pobeda1904Port-Artur.jpg"
article.text
#=> "Pobeda was the last of the three Peresvet-class pre-dreadnought battleships built for the Imperial Russian Navy at the end of the nineteenth century. The ship was assigned to the Pacific Squadron upon completion and based at Port Arthur from 1903. During the Russo-Japanese War of 1904–1905, she participated in the battles of Port Arthur and the Yellow Sea. Having escaped serious damage in these engagements, Pobeda was sunk by gunfire during the Siege of Port Arthur, and then salvaged by the Japanese and placed into service under the name Suwo (周防)."

today_article = WikipediaRestClient.get_featured_article
#=Returns featured article of the current day
today_article.title
#=> "Arlington,_Washington"
today_article.url
#=> "https://en.wikipedia.org/wiki/Arlington,_Washington"
today_article.pageid
#=> 138192
```


### Picture of the day

**Example**
```ruby
picture_of_the_day = WikipediaRestClient.get_image_of_the_day
#=>Returns pictured of the day
picture_of_the_day.title
#=>"File:Haus der Kulturen der Welt, Blaue Stunde, Berlin, 160521, ako.jpg"
picture_of_the_day.image_url
#=>"https://upload.wikimedia.org/wikipedia/commons/2/25/Haus_der_Kulturen_der_Welt%2C_Blaue_Stunde%2C_Berlin%2C_160521%2C_ako.jpg"
picture_of_the_day.image_height
#=> 3648
picture_of_the_day.thumbnail
#=>"https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Haus_der_Kulturen_der_Welt%2C_Blaue_Stunde%2C_Berlin%2C_160521%2C_ako.jpg/640px-Haus_der_Kulturen_der_Welt%2C_Blaue_Stunde%2C_Berlin%2C_160521%2C_ako.jpg"
picture_of_the_day_for_a_date = WikipediaRestClient.get_image_of_the_day("2017/03/12")
#=>Returns pictured of the day for the specified date ("YYYY/MM/DD")
picture_of_the_day_for_a_date.image_url 
#=> "https://upload.wikimedia.org/wikipedia/commons/4/4b/Cyclosia_papilionaris-Kadavoor-2016-06-17-001.jpg"
picture_of_the_day_for_a_date.description_text
#=>  "<i><a rel=\"mw:WikiLink/Interwiki\" href=\"https://en.wikipedia.org/wiki/Cyclosia%20papilionaris\" title=\"en:Cyclosia papilionaris\">Cyclosia papilionaris</a></i>, Drury's Jewel, is a moth in the <a rel=\"mw:WikiLink/Interwiki\" href=\"https://en.wikipedia.org/wiki/Zygaenidae\" title=\"en:Zygaenidae\">Zygaenidae</a> family. There are many subspecies and this is <i>Cyclosia papilionaris australinda</i> found in <a rel=\"mw:WikiLink/Interwiki\" href=\"https://en.wikipedia.org/wiki/South%20India\" title=\"en:South India\">South India</a>."
```

It will have the following information,
- title
- image_url
- image_width
- image_height
- thumbnail
- thumbnail_width
- thumbnail_height
- description_text

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Balaji-Ramasubramanian/wikipedia_rest_client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WikipediaRestClient project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Balaji-Ramasubramanian/wikipedia_rest_client/blob/master/CODE_OF_CONDUCT.md).
