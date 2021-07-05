require 'rss'
require 'open-uri'

class ConsumeRss
  def consume(url)
    puts url
    url.each do |rss_feed|
      open_feed(rss_feed)
    end
  end

  def open_feed(rss_feed)
    URI.open(rss_feed) do |rss|
      feed = RSS::Parser.parse(rss)
      puts "\n"
      puts "Title: #{feed.channel.title}"
      feed.items.each do |item|
        print_feed_item(item)
      end
    end
  rescue OpenURI::HTTPError => e
    puts "RSS Feed #{rss_feed} tidak ditemukan"
  end

  def print_feed_item(item)
    puts '---------------------'
    puts "Item: #{item.title}"
    puts "Description: #{item.description}"
    puts "Link: #{item.link}"
    puts "\n"
  end
end
