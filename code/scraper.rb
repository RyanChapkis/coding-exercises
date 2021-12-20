#this is not the final answer, just used to test code with byebug 
#final answer is on puppies.rb!

require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper
    url = "../data/paws.html"
    doc = File.open(url) { |f| Nokogiri::HTML(f) }
    dogs = Array.new
    dog_listings = doc.css('div.col-sm-4.dog') #first page
    page = 1
    per_page = dog_listings.count
    total = 102 #fix this
    last_page = 4
    while page <= last_page
        pagination_url = "../data/paws/#{page}.html"
        puts pagination_url
        puts "Page: #{page}"
        puts ''
        pagination_doc = File.open(pagination_url) { |f| Nokogiri::HTML(f) }
        pagination_dog_listings = pagination_doc.css('div.col-sm-4.dog')
        pagination_dog_listings.each do |dog_listing|
            if dog_listing.css('a')[0].text.include?('Female - Baby')
                dog = { 
                    href: dog_listing.css('a')[0].attributes["href"].value
                }
                dogs << dog
                puts "Added #{dog[:href]}"
                puts ""
            end 
        end
        page += 1
    end
    byebug
end

scraper   


