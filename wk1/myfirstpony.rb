require "rubygems" #Why should I need this? What does it?
require "nokogiri" #So I need to include you explicitly...
require 'open-uri' #Duh, you did here, right? 

@i = ARGV[0] # string

# w00t this is an comment
puts 'Good morning mister Freeman.'
puts 'Rise and shine, rise and shine.'


url = nil
#url = 'http://www.maxdesign.com.au/category/news/'

if url.nil?
  puts '404, plz get fake html'
  puts ''
  file = 'cache.html'
end

doc = Nokogiri::HTML(open(file)) #Ok, I fake cached this file :)

#xpath = doc.xpath('//p[@class="entry"]')
css   = doc.css('p.entry')

#puts xpath
#puts css

css.each_with_index do |so_what_was_this, idx|
  puts '[' + idx.to_s + '] ' + so_what_was_this.xpath('a').text #Ohja, parameter | also getting value with css? []?
end

#Ok, this is fun.
#Btw! Anyone saw GitHub for Windows? Missa like.

# Open specific url in browser
def getUrl(items)
  
  #puts @i.class
  if not @i.nil?
    puts 'You have passed the following argument: "' + @i.to_s + '"'
    i = @i.to_i
  else
    puts 'No args passed'
    puts 'Please enter a number from the list'
    i = gets.chomp || 'http://www.jaimemartinez.nl'
  end

  #STDOUT.flush
  if items[i]
    url = items[i].at_css("@href").value
    puts "You have chosen #{items[i].xpath('a').text}"
    return url
  else
    puts "There is no list number #{i}"
    return false
  end
end

# Beware! First def method, then call it... this stuff really is TOP DOWN!!! 
url = getUrl(css)

def openUrl(url)
  
  if url
    puts "Opening the url #{url}"

    #Use default browser
    #cmd = 'start' + url
    #system(cmd)
    #puts `start #{url}`
    puts 'Have fun!'
  else 
    puts 'Please try again'
  end

end

openUrl(url)

