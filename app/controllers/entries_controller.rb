class EntriesController < ApplicationController

  def index
    @entries = Entry.all
  end

  def new
  end

  def create
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["image"] = params["image"]
    @entry.uploaded_image.attach(params["uploaded_image"])
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]
    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  end

end
