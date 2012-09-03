require 'nokogiri'
require 'open-uri'

class HomeController < ApplicationController
  http_basic_authenticate_with :name => "das", :password => "boot"
  
  def index
  	
    #All db links
    @links = Link.all
    
    items = Array.new
    
    doc = Nokogiri::HTML(open('http://www.maxdesign.com.au/category/news/', "User-Agent" => 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:15.0) Gecko/20100101 Firefox/15.0'))
    
    doc.css('p.entry a').each_with_index do |item, idx|
      items << Link.new(:name => item.text, :title => item.text, :url => item.at_css("@href").value)
    end

    #items = Scraper.new('http://www.maxdesign.com.au/category/news/').collect
    # undefined method `stringify_keys' for "Some links for light reading (30/8/12)":String
    
    #Merge the db with the scraper
    @links += items

    if @links
      @widget_title = 'Some links for light reading'
    else
      @widget_title = 'Noting to see, please move on...'
    end

  end
end
