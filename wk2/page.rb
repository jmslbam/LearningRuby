require 'sinatra'
#require "sinatra/reloader" #http://www.sinatrarb.com/contrib/reloader Install dev kit properly
require 'erb'
require_relative 'scraper.rb'

class Page

	attr_reader :links

	def initialize(links)
		@links	= links
	end 

	# Support templating of member data.
  def get_binding
    binding
  end
	
	def render
		#
	end

end

get('/') { 
	
	file = open(File.dirname(__FILE__) + '/index.rhtml').read
	rhtml  	= ERB.new(file)
	
	links 	= Scraper.new('cache.html').collect
	# Produce result.
	page  = Page.new(links)
	return rhtml.result(page.get_binding) #why doesn't .run works?

}