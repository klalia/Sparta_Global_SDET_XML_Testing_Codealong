require 'nokogiri'

class Guiseppes

  attr_accessor :menu

  def initialize
    @menu = Nokogiri::XML(File.open('./xml_menu.xml'))
  end

  # get all prices as floas
  def get_all_prices_as_floats
    price_array = []
    @menu.xpath('//price').each do |price|
      price_array << price.text.gsub('£', '').to_f
    end
    price_array
  end

  def get_all_food_items
    @menu.search('food')
  end

end
