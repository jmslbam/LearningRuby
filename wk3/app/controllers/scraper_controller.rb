require 'open-uri'

class Scraper
 
  attr_accessor :file

  def initialize(file)	
    @file	= file
  end

  def collect
    items = Array.new

    doc = Nokogiri::HTML(open('http://www.maxdesign.com.au/category/news/', "User-Agent" => 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:15.0) Gecko/20100101 Firefox/15.0'))
    
    doc.css('p.entry a').each_with_index do |item, idx|
      items << Link.new(:name => item.text, :title => item.text, :url => item.at_css("@href").value)
    end

    return items

  end

end