require 'nokogiri'
require 'open-uri'

class HomeController < ApplicationController
  http_basic_authenticate_with :name => "das", :password => "boot"
  
  def index
  	
    #All db links
    @links = Link.all + Link.getExternalLinks
    
    if @links
      @widget_title = 'Some links for light reading'
    else
      @widget_title = 'Noting to see, please move on...'
    end

  end
end
