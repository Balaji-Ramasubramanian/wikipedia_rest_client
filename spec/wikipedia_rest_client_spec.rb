require "spec_helper"

RSpec.describe WikipediaRestClient do
  
  	it "has a version number" do
    	expect(WikipediaRestClient::VERSION).not_to be nil
  	end

	it 'should return a page content' do
		input = 'java'
		output = WikipediaRestClient.get_page(input)
		expect(output).not_to be nil
	end

	it 'should have valid title' do
		input = 'java'
		output = WikipediaRestClient.get_page(input)
		expect(output.title).to eq 'Java'
	end

	it 'should have valid url' do
		input = 'main page'
		output = WikipediaRestClient.get_page(input)
		expect(output.url).to eq 'https://en.wikipedia.org/wiki/Main_Page'
	end

	it 'should have page id' do
		input = 'main page'
		output = WikipediaRestClient.get_page(input)
		expect(output.pageid).not_to be nil
	end

	it 'should return a random page' do
		output = WikipediaRestClient.get_random
		expect(output).to be_an_instance_of(WikipediaRestClient::Page)
	end

	it 'should return image of the day' do
		output = WikipediaRestClient.get_image_of_the_day
		expect(output).to be_an_instance_of(WikipediaRestClient::ImageOfTheDay)
	end

	it 'should return image url for image of the day' do
		output = WikipediaRestClient.get_image_of_the_day
		expect(output.image_url).not_to be nil
	end

end

