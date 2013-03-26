require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'kconv'


class ZozoService

  @@domain = "http://zozo.jp"
  @@encoding = "utf-8"

  def getMenuHash
    doc = Nokogiri::HTML(open(@domain))
    doc.encoding = @@encoding
    hash = {}
    doc.css("div#menuCategory > ul > li > a").each do |el|
      hash.store(el.text(), el.attr('href'))
    end
    return hash
  end

  def getElements(url, css)
    doc = Nokogiri::HTML(open(url))
    doc.encoding = "utf-8"
    hash = {}
    doc.css(css).each do |el|
      el.attr("href") =~ /p_tyid=(\d+)/
      text = el.text()
      hash.store($1, text)
    end
    return hash
  end

  getMenuHash($domain).each do |name, href|
    puts name
    getElements($domain + href, "#catelabelList li a").each do |tycid, catname|
      puts "  #{tycid} : #{catname}"
    end
  end

end
