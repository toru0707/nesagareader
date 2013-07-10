# coding: utf-8
$LOAD_PATH << File.dirname(__FILE__) + '/../lib'
require 'test/unit'
require 'nesagari'
class IndexPageParserTest < Test::Unit::TestCase

  def setup
    @parser = Nesagari::IndexPageParser.new("http://zozo.jp")
  end

  # 25のカテゴリを取得していること
  # p_tycid=101のCategoryLinkが存在し、トップスのタイトルであること
  def test_parse
    categories =  @parser.parse_menu_categories

    assert_equal(25, categories.size)
    categories.each do |c|
      assert_instance_of(Nesagari::CategoryLink, c)
      if (c.category_id == "101") then
        assert_equal("トップス", c.title)
      end
    end
  end
end

