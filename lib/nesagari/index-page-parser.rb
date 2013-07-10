require 'nokogiri'
require 'open-uri'

module Nesagari
  class IndexPageParser

    def initialize url
      @doc = Nokogiri::HTML(open(url))
    end

    # 左端のカテゴリをパースし、CategoryLinkの配列として返す
    # @return CategoryLink[] 
    def parse_menu_categories
      category_arr = []
      @doc.css("#menuCategory > ul.lists > li > a").each do |c_ele|
        category_arr.push(Nesagari::CategoryLink.new(c_ele)) 
      end
      return category_arr
    end
  end
end
