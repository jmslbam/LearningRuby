require 'nokogiri'
require 'open-uri'
require_relative 'link'

class Scraper
 
	attr_reader :file

	def initialize(file)		
			@file	= file
	end 

 def collect
 	items = Array.new

 	doc = Nokogiri::HTML(open(self.file)) #Ok, I fake cached this file :)
	doc.css('p.entry a').each_with_index do |item, idx|
		items << Link.new(item.text, item.at_css("@href").value) #how to create a multi dim array like bla << {'link' => value, 'text' => value2 }
	end

	return items

 end

 def show	
	self.collect.each_with_index do |item, idx|
		puts '[' + idx.to_s + '] ' + item
	end
 end
	
end