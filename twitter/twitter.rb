#!/usr/bin/env ruby
# encoding: utf-8

#ライブラリの呼び出し
require 'twitter'

@client = Twitter::REST::Client.new do |config|
  #Please enter the following
  #consumer key
  #consumer key secret
  #access token
  #access token secret
  config.consumer_key        = ""
  config.consumer_secret     = ""
  config.access_token        = ""
  config.access_token_secret = ""
end

#help
def help
  file = File.open("./help.txt")
  text = file.read
  print text
  file.close
end

#post tweet
def mein_post_tweet(get_strings)
  @client.update(get_strings)
  puts "Posted your tweet!"
end

#view timeline
def timeline
  @client.list_timeline("listcreate_user", "list_name").each do |tweet|
    puts "\e[33m" + tweet.user.name + "\e[32m" + "[ID:" + tweet.user.screen_name + "]"
    puts "\e[0m" + tweet.text
  end
end

#view mention timeline
def timeline_mention
  @client.mentions_timeline.each do |tweet|
    puts "\e[33m" + tweet.user.name + "\e[32m" + "[ID:" + tweet.user.screen_name + "]"
    puts "\e[0m" + tweet.text
  end
end

def home_timeline
  @client.home_timeline.each do |tweet|
   puts "\e[33m" + tweet.user.name + "\e[32m" + "[ID:" + tweet.user.screen_name + "]"
   puts "\e[0m" + tweet.text
  end
end

#no command
def no_command
  puts "there is no  command"
  file = File.open("./help.txt")
  text = file.read
  print text
  file.close
end
