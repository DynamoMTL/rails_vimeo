class VideosController < ApplicationController
  def new
  end

  def create
    title = params[:title]
    video_io = params[:video_file]
  end
end
