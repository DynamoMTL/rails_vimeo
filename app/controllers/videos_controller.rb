class VideosController < ApplicationController
  def index
  end

  def new
  end

  def create
    title = params[:title]
    video_io = params[:video_file]
    redirect_to videos_path
  end
end
