require "httparty"
require "nokogiri"
require "json"

url = "http://finance.yahoo.com/q?s=AAPL"

response = HTTParty.get url

dom = Nokogiri::HTML(response.body)

my_span = dom.xpath("//span[@id='yfs_l84_aapl']").first

puts "The stock price for AAPL is $#{my_span.content}"