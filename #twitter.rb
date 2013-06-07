#twitter.rb

require 'twitter'
Twitter.search("from:JonyFuckingIve", :count => 3, :result_type => "recent").results.map do |status|
  "#{status.from_user}: #{status.text}"
end