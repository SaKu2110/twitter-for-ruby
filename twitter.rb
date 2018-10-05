#!/usr/bin/env ruby
# encoding: utf-8

#ライブラリの呼び出し
#require 'twitter'

class Tweet

  attr_reader :loop_condition

  def initialize()

    #test
    #@client = Twitter::REST::Client.new do |config|
    #  config.consumer_key        = ""
    #  config.consumer_secret     = ""
    #  config.access_token        = ""
    #  config.access_token_secret = ""
    #end

  end

  def catch_command(option)
    if option == "-h" || option == "--help" then
      help
    end
  end

  def help
    puts "[-h]"
  end

end

tweet = Tweet.new

option = ARGV[0].to_s
tweet.catch_command(option)
