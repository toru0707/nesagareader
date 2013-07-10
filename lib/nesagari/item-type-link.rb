module Nesagari
  class ItemTypeLink
    ITEM_TYPE_ID_KEY = "p_tyid"

    attr_accessor :item_type_id,:url,:title

    def initialize(item_type_id, title, url)
      @item_type_id = item_type_id
      @url = url
      @title = title
    end

    # item_typeのaタグを使用
    # @param Nokogiri::Doc
    def initialize(a_ele)
      href = a_ele['href']
      u = URI.parse(href)
      p = CGI.parse(u.query)
      @item_type_id = p[ITEM_TYPE_ID_KEY]
      @url = href
      @title = a_ele.css("span").first.content
    end
  end
end
