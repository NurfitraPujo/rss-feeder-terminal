require_relative './consume_rss'
require 'open-uri'

def main
  puts 'Masukkan link RSS anda'
  inputed_rss = gets.chomp
  rss_consumer = ConsumeRss.new
  rss_consumer.consume(inputed_rss)
end

main
