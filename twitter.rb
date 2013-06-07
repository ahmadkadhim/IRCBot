#twitter.rb

require 'twitter'
require 'date'

class Twitter_searcher

	attr_accessor :goback

	def initialize
		@multitweets = []
		@goback = 0
	end

	Twitter.configure do |config|
	  config.consumer_key = "K4cAPxDrBKiyMo0buur4Q"
	  config.consumer_secret = "C70HdLcx1TTeNC6mm97Ofzkkw4VcKwz2SyghCSok"
	  config.oauth_token = "318730911-buyuO1HiQ23gxzfzcRgrHdsyAvEnQZlM0L41XjTB"
	  config.oauth_token_secret = "Qu58hiOCyRo0tZGJxgiaYEazqXadKKZW8nbkOqs0"
	end

	def twit_search(fromuser)
		@goback += 1 if @goback < 4
		@multitweets = []
		Twitter.search("from:#{fromuser}", :count => 1, :until => prev_day, :result_type => "recent").results.map do |status|
		  result = "#{status.from_user}: #{status.text}"
		  @multitweets << result
		end
		@multitweets.join
	end

	def prev_day
		now = Date.today
		now -= @goback
		puts now
		now.to_s
	end
end

# t = Twitter_searcher.new
# while true
# 	t.twit_search("robdelaney")
# 	sleep(2)
# end
