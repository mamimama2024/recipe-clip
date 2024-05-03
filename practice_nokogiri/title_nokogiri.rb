require 'nokogiri'

html = open('nokogiri_practice.html').read
doc = Nokogiri::HTML.parse(html)
title = doc.title
puts title

# 参考URL
# https://zenn.dev/arao99/articles/a68d8039f85fa8