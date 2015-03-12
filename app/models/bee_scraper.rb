require 'open-uri'
class BeeScraper

  # def call
  #   get_search_params
  #   scrape(get_search_params)

  # end

  # def get_search_params
  #   puts "What do you want to search for today, Bee?"
  #   response = gets
  #   response.to_a
 

  # def scrape(bee_params)

  #   url = "http://www.google.com/search?q=#{bee_params}"
  #   puts url
  #   doc = Nokogiri::HTML(open(url))

  #   doc.css('.g .r a').each{|l| puts l.content}
  #     doc.css('.g .r a').each do |item|
  #     link= CGI.parse(URI.parse(item['href']).query)['q'].first
  #     doc = Nokogiri::HTML(open(link))
  #     # binding.pry
  #     link
  #     puts "title: " + doc.title.to_s
  #     # puts "description: " + doc.xpath('//meta[@name="description"]/@content').map(&:value).to_s
  #   end
  # end

  def html(search_params)
    @links = []
    url = "http://www.google.com/search?q=#{search_params}"
    doc = Nokogiri::HTML(open(url))
    doc.css('.g .r a').each do |item|
      @links << CGI.parse(URI.parse(item['href']).query)['q'].first
    end
    @links
  end

  def found_item(search_params) 
    @found_items = []
    url = "http://www.google.com/search?q=#{search_params}"
    doc = Nokogiri::HTML(open(url))
    doc.css('.g .r a').each do |item|
      @found_items << item.text
    end
    @found_items
  end
end