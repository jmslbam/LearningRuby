# w00t this is an comment
puts 'Good morning mister Freeman.'
puts 'Rise and shine, rise and shine.'

require "rubygems" #Why should I need this? What does it?
require "nokogiri" #So I need to include you explicitly...
require 'open-uri' #Duh, you did here, right? 

#Why should I use the monkey? @
#What is the @?

doc   = Nokogiri::HTML(open("http://www.maxdesign.com.au/category/news/")) #cache this to file?

xpath = doc.xpath('//p[@class="entry"]')
css   = doc.css('p.entry')

#puts xpath
#puts css

css.each do |so_what_was_this|
  puts so_what_was_this.xpath('a').text #Ohja, parameter
end

#Ok, this is fun.
#Btw! Anyone saw GitHub for Windows? Missa like.