require 'open-uri'

html = URI.open('https://arao99.github.io/zenn_scraping/nokogiri_practice.html').read
puts html