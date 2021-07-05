require_relative './consume_rss'
require 'open-uri'

def main
  inputed_rss_arr = []
  loop do
    puts 'Masukkan feed RSS anda'
    inputed_rss = gets.chomp
    inputed_rss_arr << inputed_rss
    puts 'Apakah anda mau memasukkan feed RSS lagi?'
    user_choice = gets.chomp
    break if user_choice != 'Y'
  end
  rss_consumer = ConsumeRss.new
  rss_consumer.consume(inputed_rss_arr)
end

main
