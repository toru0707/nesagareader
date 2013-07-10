# coding: utf-8
$LOAD_PATH << File.dirname(__FILE__) + '/../lib'
require 'test/unit'
require 'nesagari'
class CategoryPageParserTest < Test::Unit::TestCase

  def setup
   @parser = Nesagari::CategoryPageParser.new("http://zozo.jp/_search/search_result.html?p_tycid=101&p_maid=1&p_cutyid=0&p_ptype=0")
  end

  # トップスで14のアイテムタイプを取得していること
  # item_type_id=2001のItemTypeLinkが存在し、Tシャツ・カットソーのタイトルであること
  def test_parse
    item_types =  @parser.parse_item_types

    assert_equal(14, item_types.size)
    item_types.each do |c|
      assert_instance_of(Nesagari::ItemTypeLink, c)
      if (c.item_type_id == "2001") then
        assert_equal("Tシャツ・カットソー", c.title)
      end
    end
  end
end

