require 'json'

class SessionsController < ApplicationController
  def create
    session[:access_token] = request.env['omniauth.auth']['credentials']['token']
    session[:access_token_secret] = request.env['omniauth.auth']['credentials']['secret']
    redirect_to show_path, notice: 'Signed in'
  end

  # def fetch_all_friends(twitter_username, max_attempts = 100)
  #   # in theory, one failed attempt will occur every 15 minutes, so this could be long-running
  #   # with a long list of friends
  #   num_attempts = 0
  #   #client = twitter_client
  #   myfile = File.new("#{twitter_username}_friends_list.txt", "w")
  #   running_count = 0
  #   cursor = -1
  #   list = []
  #   while (cursor != 0) do
  #     begin
  #       num_attempts += 1
  #       # 200 is max, see https://dev.twitter.com/docs/api/1.1/get/friends/list
  #       friends = client.friends(twitter_username, {:cursor => cursor, :count => 200} )
  #       friends.each do |f|
  #         running_count += 1
  #         list << f
  #         myfile.puts "\"#{running_count}\",\"#{f.name.gsub('"','\"')}\",\"#{f.screen_name}\",\"#{f.url}\",\"#{f.followers_count}\",\"#{f.location.gsub('"','\"').gsub(/[\n\r]/," ")}\",\"#{f.created_at}\",\"#{f.description.gsub('"','\"').gsub(/[\n\r]/," ")}\",\"#{f.lang}\",\"#{f.time_zone}\",\"#{f.verified}\",\"#{f.profile_image_url}\",\"#{f.website}\",\"#{f.statuses_count}\",\"#{f.profile_background_image_url}\",\"#{f.profile_banner_url}\""
  #       end
  #       puts "#{running_count} done"
  #       cursor = friends.next_cursor
  #       break if cursor == 0
  #     rescue Twitter::Error::TooManyRequests => error
  #       if num_attempts <= max_attempts
  #         cursor = friends.next_cursor if friends && friends.next_cursor
  #         puts "#{running_count} done from rescue block..."
  #         puts "Hit rate limit, sleeping for #{error.rate_limit.reset_in}..."
  #         sleep error.rate_limit.reset_in
  #         retry
  #       else
  #         raise
  #       end
  #     end
  #   end
  #   return list
  # end


  def show
    if session['access_token'] && session['access_token_secret']
      @user = client.user(include_entities: true)
      #@friends = client.friends.to_a
      #@friends = fetch_all_friends('ksmetana', 100)
      @friends = client.friends("jianbinljb").to_a

      @info = tumblr_client.info

      gon.friends =  @friends
    else
      redirect_to failure_path
    end
  end

  def error
    flash[:error] = 'Sign in with Twitter failed'
    redirect_to root_path
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Signed out'
  end
end
