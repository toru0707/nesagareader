require 'nokogiri'
require 'uri'
require 'cgi'
module Nesagari
  class CategoryLink

    CATEGORY_ID_KEY = "p_tycid"
    SEX_ID_KEY = "p_cutyid"
    PRICE_TYPE_ID_KEY = "p_ptype"

    attr_accessor :category_id, 
      # 0:all, 1:men, 2:wemen
      :sex_id,
      # 0:all
      :price_type_id,
      :title,
      :url

    def initialize(category_id, sex_id, price_type_id, title, url)
      @category_id = category_id
      @sex_id = sex_id
      @price_type_id = price_type_id
      @title = title
      @url = url
    end

    # categoryのaタグを使用
    # @param Nokogiri::Doc
    def initialize(a_ele)
      href = a_ele['href']
      u = URI.parse(href)
      p = CGI.parse(u.query)
      @category_id = p[CATEGORY_ID_KEY]
      @sex_id = p[SEX_ID_KEY]
      @price_type_id = p[PRICE_TYPE_ID_KEY]
      @url = href
      @title = a_ele.content
    end
  end
end
