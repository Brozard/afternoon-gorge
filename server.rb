require "sinatra"
require "httparty"
require "nokogiri"
require "json"

class Stock
  attr_reader :my_span
  def initialize(symbol)
    url = "http://finance.yahoo.com/q?s=#{symbol.downcase}"
    response = HTTParty.get url
    dom = Nokogiri::HTML(response.body)
    @my_span = dom.xpath("//span[@id='yfs_l84_#{symbol.downcase}']").first.content
  end
end

get "/" do
  symbol = params['stock']
  stock = Stock.new(symbol)
  "The stock price for #{symbol.upcase} is $#{stock.my_span}"
end