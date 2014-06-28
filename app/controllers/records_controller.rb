class RecordsController < ApplicationController
  require 'net/http'

  def index
    @records = Record.all
  end

  def create
    @record = Record.create!(record_params)
    @records = Record.all

    respond_to do |format|
      format.js
    end
  end

  def search
    artist = params[:artist]

    #@results = Net::HTTP.get('api.discogs.com', "/database/search?artist=#{artist}")
    @results = IO.read(Rails.root + 'tmp/response.json')

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy

    respond_to do |format|
      format.js {render nothing: true}
    end
  end

  private

  def record_params
    params.permit(:cover, :title, :label, :country, :year, :url, :discogs_id)
  end
end
