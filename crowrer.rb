require 'rubygems'
require 'anemone'
require 'kconv'

url = "http://zozo.jp/_search/search_result.html?p_maid=1&p_type=1&dstk=1&dord=21&dcolor=1&p_ptype=0&dptc=2&p_aid=1&p_scid=&p_scpid=&p_tbid=&p_tycid=117&p_tyid=&p_price=&p_pris=&p_prie=&p_cocid=&p_gtagid=&p_cutyid=&p_stype=&i=&e=&p_isize=&p_fslid=&search=&p_gtype="
Anemone.crawl(url) do |anemone|
  anemone.on_every_page do |page|
    doc = page.doc
    doc.encoding = "utf-8"
    title = doc.xpath("//head/title/text()").first.to_s if page.doc
    puts title
    puts page.url
  end
end
