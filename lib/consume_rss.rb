require 'rss'
require 'open-uri'

class ConsumeRss
  def consume(url)
    URI.open(url) do |rss|
      feed = RSS::Parser.parse(rss)
      puts "Title: #{feed.channel.title}"
      feed.items.each do |item|
        puts '---------------------'
        puts "Item: #{item.title}"
        puts "Description: #{item.description}"
        puts "Link: #{item.link}"
        puts "\n"
      end
    end
  end
end
