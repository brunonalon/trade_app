namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    # [User, Item, Conversation, Like, Match, Message].each(&:delete_all)
    # User.populate 20 do |user|
    #   user.name = Faker::Name.name
    #   user.longitude = Faker::Address.longitude
    #   user.latitude = Faker::Address.latitude
    #   userid = user.id
    #   Item.populate 1 do |item|
    #     item.name = Faker::Commerce.product_name
    #     item.user_id = userid
    #     #samps = Urss.at("https://api.flickr.com/services/feeds/photos_public.gne?tags="+tag1+","+tag2+"&format=rss_200")
    #     samps = Urss.at("http://www.degraeve.com/flickr-rss/rss.php?tags=cars%2C+bikes%2C&tagmode=all&sort=relevance&num=25")
    #     sam = samps.entries.map{ |entry| entry.medias.collect(&:content_url) }.flatten
    #     item.url = sam.shuffle.sample
    #   end
    # end
    # @lastone = User.last.id
    # [1,2,3].each do |i|
    #   Match.populate 30 do |match|
    #     match.item_offered_id = User.last.id + i
    #     match.item_liked_id = Faker::Number.between(1, 20)
    #     match.user_offered_id = match.item_offered_id
    #     match.user_liked_id = match.item_liked_id
    #   end
    # end
    Item.populate 20 do |item|
      item.name = Faker::Commerce.product_name
      item.user_id = 1
      #samps = Urss.at("https://api.flickr.com/services/feeds/photos_public.gne?tags="+tag1+","+tag2+"&format=rss_200")
      samps = Urss.at("http://www.degraeve.com/flickr-rss/rss.php?tags=cars%2C+bikes%2C&tagmode=all&sort=relevance&num=25")
      sam = samps.entries.map{ |entry| entry.medias.collect(&:content_url) }.flatten
      item.url = sam.shuffle.sample
    end

  end
end
