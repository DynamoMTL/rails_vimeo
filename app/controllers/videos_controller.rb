class VideosController < ApplicationController
  def index
  end

  def new
  end

  def create
    video = params[:video_file].tempfile
    uploader = Vimeo::Advanced::Upload.new(ENV['CLIENT_ID'],
                                           ENV['CLIENT_SECRET'],
                                           token: session[:user_token],
                                           secret: session[:user_secret])
    p "CLIEND_ID: #{ENV['CLIENT_ID']}"
    p "CLIEND_SECRET: #{ENV['CLIENT_SECRET']}"
    p "USER_TOKEN: #{session[:user_token]}"
    p "USER_SECRET: #{session[:user_secret]}"

    uploader.upload video
    redirect_to videos_path
  end
end
