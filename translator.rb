#!/usr/bin/ruby
require 'net/http'
require 'kconv'

Net::HTTP.version_1_2

str = ARGV.shift || "hello"
lang= ARGV.shift || "ENJA"
a = Net::HTTP.start('www.excite.co.jp', 80)
b = a.post('/world/english',"before="+str+"&wb_lp="+lang)
puts b.message
c = b.body.to_s.toutf8
d = c.scan(/textarea [^>]*>([^<]*?)<\/textarea>/)
p d[1].to_s.toutf8
