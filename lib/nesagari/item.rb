class Item
  def initialize(url)
    @pageUrl = url
    @imageUrl = ""
    @attrHash = {}
  end

  attr_accessor :pageUrl, :imgUrl, :attrHash
end

