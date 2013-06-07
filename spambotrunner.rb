#spambotrunner

require_relative "ircbot.rb"
require_relative "twitter.rb"
require "socket"

class Spambotrunner

	def self.run

		ircbot = Twitterspambot.new
		twitsearcher = Twitter_searcher.new

		irc_server = ircbot.irc_server

		ircbot.send_message("Hello this is Jony Fucking Ive. If you want more Jony please say 'Gimme some Jony'")

		until irc_server.eof? do
			msg = irc_server.gets.downcase
			puts msg
		
			if ircbot.channel_message?(msg) && ircbot.jony?(msg)
				tweets = twitsearcher.twit_search("JonyFuckingIve", ircbot.countback)
					tweets.split("\n").each do |x|
					ircbot.send_message(x)
					end
				ircbot.countback += 7	
			end
		end

	end
end

Spambotrunner.run