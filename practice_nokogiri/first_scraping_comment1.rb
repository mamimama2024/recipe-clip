require 'open-uri'
require 'nokogiri'

url = 'https://www.yahoo.co.jp/'

# 取得されたメタ情報のうちContent-Typeとcharsetを確認する
URI.open(url) {|f|
  p f.content_type
  p f.charset
}

# 参考URL
# https://docs.ruby-lang.org/ja/2.7.0/library/open=2duri.html

# urlにアクセスしてhtmlを取得する
html = URI.open(url).read

# 取得したhtmlをNokogiriでパースする
doc = Nokogiri::HTML.parse(html)

# 参考URL
# https://nokogiri.org/

# ニュースの見出しを取得して出力する
doc.at_css('section#tabpanelTopics1 ul').css('h1').each do |h1|
  puts h1.text.strip
end
