require 'pp'

class VimeoController < ApplicationController
  def auth
    consumer_key = ENV['CLIENT_ID']
    consumer_secret = ENV['CLIENT_SECRET']
    base = Vimeo::Advanced::Base.new(consumer_key ,consumer_secret)
    request_token = base.get_request_token
    session[:oauth_secret] = request_token.secret
    redirect_to base.authorize_url
  end

  def callback
    consumer_key = ENV['CLIENT_ID']
    consumer_secret = ENV['CLIENT_SECRET']
    base = Vimeo::Advanced::Base.new(consumer_key, consumer_secret)
    access_token = base.get_access_token(params[:oauth_token], session[:oauth_secret], params[:oauth_verifier])
    session[:user_token] = access_token.token
    session[:user_secret] = access_token.secret
    redirect_to root_path
  end
end
