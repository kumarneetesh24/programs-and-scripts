require "httparty"
require "nokogiri"
require "pry"

page = HTTParty.get('http://discuss.codechef.com/questions/48877/data-structures-and-algorithms')
page_parse = Nokogiri::HTML(page)
Pry.start(binding)
