require 'open-uri'
require 'nokogiri'
require 'kconv'

url = 'https://www.makita.co.jp/'

# urlにアクセスしてhtmlを取得し、その文字コードをUTF-8に変換する
html = URI.open(url).read.toutf8

# 取得したhtmlをNokogiriでパースする
doc = Nokogiri::HTML.parse(html)

# htmlのtitleを取得して出力する
title = doc.title
puts title

# 参考URL
# https://github.com/arao99/zenn_scraping