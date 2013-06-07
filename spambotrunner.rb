#spambotrunner

require_relative "ircbot.rb"
require_relative "twitter.rb"
require "socket"

class Spambotrunner

	def self.run

		ircbot = Twitterspambot.new
		twitsearcher = Twitter_searcher.new

		irc_server = ircbot.irc_server

		ircbot.send_message("Say 'bloodsucking vampires' for Goldman Sachs Elevator Gossip")

		until irc_server.eof? do
			msg = irc_server.gets.downcase
			puts msg
		
			if ircbot.channel_message?(msg) && ircbot.trigger?(msg)
				tweets = twitsearcher.twit_search("gselevator")
					tweets.split("\n").each do |x|
					ircbot.send_message(x)
					end	
			end
		end

	end
end

Spambotrunner.run