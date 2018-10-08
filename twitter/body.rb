require './twitter'

def post_tweet

  @past_sentences = nil
  @post_sentences = nil
  @catch_strings  = nil

  loop_condition = true
  while loop_condition
    puts ">>\n"
    if @past_sentences != nil
      puts "#{@past_sentences}"
    end
    @catch_strings = gets.chomp
    puts "Would you like to post the following tweets?[Y/n]"
    answer = gets.chomp
    if answer == "Y" then
    #編集を終了
        loop_condition = false
      if @past_sentences != nil then
        @post_sentences = @past_sentences + @catch_strings
      else
        @post_sentences = @catch_strings
      end
    else
    #編集を継続
      puts "OK! Continue editing"
      if @past_sentences == nil then
        @past_sentences = @catch_strings + "\n"
      else
        @pastsentences += @catch_strings + "\n"
      end
      @catch_strings = nil
    end

  end
    mein_post_tweet(@post_sentences)
end

option = ARGV[0].to_s
option_1 = ARGV[1].to_s

if option == "-h" then
  help
elsif option == "" then
  post_tweet
elsif (option == "-t" && option_1 == "l") || option == "-lt" then
  timeline
elsif ( option == "-t" && option_1 == "-m" ) || option == "-mt" then
  timeline_mention
elsif ( option == "-t" && option_1 == "-h" ) || option == "-ht" then
  home_timeline
else
  no_command
end

