require 'nokogiri'
require 'open-uri'

module Nesagari
  class CategoryPageParser

    def initialize url
      @doc = Nokogiri::HTML(open(url))
    end

    # 画面中央部のアイテムカテゴリ部をパースする
    # @return ItemTypeLink[] 
    def parse_item_types
      item_type_arr = []
      @doc.css("#narrowTypeList > ul.clearfix > li > a").each do |c_ele|
        item_type_arr.push(Nesagari::ItemTypeLink.new(c_ele)) 
      end
      return item_type_arr
    end
  end
end
