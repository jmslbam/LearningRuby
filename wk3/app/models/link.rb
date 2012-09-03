class Link < ActiveRecord::Base
  attr_accessible :name, :title, :url

=begin
  #wrong number of arguments (1 for 3) 
  attr_reader :name, :title, :url

  def initialize(name, title , url)
    @name, @title, @url = name, title, url
  end 
=end

end
