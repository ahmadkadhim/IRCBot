#ircbotftw

class Twitterspambot
	attr_accessor :irc_server, :countback

	require "socket"

	def initialize
		@channel = "#bitmaker"
		@greeting_prefix = "privmsg #bitmaker :"
		@trigger = "gimme some jony"
		@countback = 0
		@irc_server = connect_to_server
	end

	def connect_to_server
		server = "chat.freenode.net"
		port = "6667"
		nick = "JonyBot"
		irc_server = TCPSocket.open(server, port)
		irc_server.puts "USER jonyfuckingivebot 0 * JonyFuckingIveBot"
		irc_server.puts "NICK #{nick}"
		irc_server.puts "JOIN #{@channel}"
		irc_server
	end

	def channel_message?(msg)
		msg.include?(@greeting_prefix)

	end

	def jony?(msg)
		msg.include?(@trigger)
	end

	def send_message(msg)
		@irc_server.puts "PRIVMSG #{@channel} :#{msg}"
	end
	
end

