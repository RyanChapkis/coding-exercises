require 'nokogiri'
#require 'httparty'
require 'byebug'
#!/usr/bin/env ruby

# Build a scraper for a dog adoption website. This scraper should open the paws.html page and collect all baby female dogs on each page. The scraper
# should return the href sources for each matching dog. The DIRECTORY constant contains directory containing paws.html.
#
# Hint: You will likely want to use an HTML parser like Nokogiri and use the page's pagination to iterate each page.
#
class Puppies
  #/path/to/dir
  DIRECTORY = ::File.join(::File.dirname(__FILE__), '../data')

  def self.parse
    url = "../data/paws.html"
    doc = File.open(url) { |f| Nokogiri::HTML(f) }
    dogs = Array.new
    dog_listings = doc.css('div.col-sm-4.dog') #first page
    page = 1
    per_page = dog_listings.count
    total = 102 
    last_page = Dir.glob(File.join(DIRECTORY + '/paws', '**', '*')).select { |file| File.file?(file) }.count
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
    return dogs
    #byebug
  end   
  
end