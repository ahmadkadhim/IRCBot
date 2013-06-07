#twitter.rb

require 'twitter'
require 'date'

class Twitter_searcher

	def initialize
		@multitweets = []
	end

	Twitter.configure do |config|
	  config.consumer_key = "K4cAPxDrBKiyMo0buur4Q"
	  config.consumer_secret = "C70HdLcx1TTeNC6mm97Ofzkkw4VcKwz2SyghCSok"
	  config.oauth_token = "318730911-buyuO1HiQ23gxzfzcRgrHdsyAvEnQZlM0L41XjTB"
	  config.oauth_token_secret = "Qu58hiOCyRo0tZGJxgiaYEazqXadKKZW8nbkOqs0"
	end

	def twit_search(fromuser, countback)
		Twitter.search("from:#{fromuser}", :count => 3, :until => prev_day(countback), :result_type => "recent").results.map do |status|
		  result = "#{status.from_user}: #{status.text}"
		  @multitweets << result.split("\n")[0..-2].join("\n")
		  @multitweets << "=================================\n"
		end
		@multitweets.join
	end

	def prev_day(countback)
		now = Date.today
		now -= countback
		puts now
	end
end

# t = Twitter_searcher.new
# t.twit_search("JonyFuckingIve", t.prev_day)