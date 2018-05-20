# WikipediaRestClient

'wikipedia_rest_client' is a ruby gem to extract the contents from Wikipedia page. 
By using this gem we can,
- get the wikipedia page contents for given topic
- Today's featured article
- Picture of the day from wikipedia webpage.

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

TODO: Write usage instructions here

##Page Summary

**Example**
```ruby
page = WikipediaRestClient.get_page("")
  #Returns an object that contains contents of the required page
page.title
 #=>
page.text
 #=>
page.image_url
 #=>
page.url 
 #=>
page.pageid
 #=>
page.description
 #=>
```

##Random Article 

**Example**
```ruby
page = WikipediaRestClient.get_random
 #=>Return a random page from wikipedia
page.title
 #=>"Adams Glacier (Victoria Land)"
page.text
 #=>"Adams Glacier is a small glacier immediately south of Miers Glacier in Victoria Land. The heads of Adams and Miers glaciers, both located in the Miers Valley, are separated by a low ridge, and the east end of this ridge is almost completely surrounded by the snouts of the two glaciers, which nearly meet in the bottom of the valley, about 1 mile (1.6 km) above Lake Miers, into which they drain. It was named by the New Zealand Northern Survey Party of the Commonwealth Trans-Antarctic Expedition (1956–58) after Lieutenant Jameson Adams, second in command of the shore party of the British Antarctic Expedition (1907–09), who was one of the men to accompany Ernest Shackleton to within 97 miles (156 km) of the South Pole."
page.url
 #=>"https://en.wikipedia.org/wiki/Adams_Glacier_(Victoria_Land)"
page.pageid
 #=>16524953
page.image_url
 #=>"https://upload.wikimedia.org/wikipedia/commons/2/24/Antarctica_relief_location_map.jpg"

```

##Today's Featured Article

```ruby
article_of_the_day = WikipediaRestClient.get_today_featured_article
#=>Returns today's featured article

article = WikipediaRestClient.get_today_featured_article(<DATE>)
#=>Returns featured article for the specified date

article = WikipediaRestClient.get_today_featured_article("2018/05/10")
#=> Returns featured article dated (2018/05/10)

```

##Picture of the day

**Example**
```ruby
picture = WikipediaRestClient.get_image_of_the_day
#=>Returns pictured of the day
picture.title
#=>"File:Haus der Kulturen der Welt, Blaue Stunde, Berlin, 160521, ako.jpg"
picture.description_text
#=>
picture.image_url
#=>"https://upload.wikimedia.org/wikipedia/commons/2/25/Haus_der_Kulturen_der_Welt%2C_Blaue_Stunde%2C_Berlin%2C_160521%2C_ako.jpg"
picture.image_height
#=> 3648
picture.thumbnail
#=>"https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Haus_der_Kulturen_der_Welt%2C_Blaue_Stunde%2C_Berlin%2C_160521%2C_ako.jpg/640px-Haus_der_Kulturen_der_Welt%2C_Blaue_Stunde%2C_Berlin%2C_160521%2C_ako.jpg"
old_picture = WikipediaRestClient.get_image_of_the_day("2017/03/12")
#=>Returns pictured of the day for the specified date ("YYYY/MM/DD")
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Balaji-Ramasubramanian/wikipedia_rest_client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WikipediaRestClient project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/wikipedia_rest_client/blob/master/CODE_OF_CONDUCT.md).
