class RecordsController < ApplicationController
  require 'net/http'

  def index
  end

  def search
    artist = params[:artist]

    #json = JSON.parse(Net::HTTP.get('api.discogs.com', "/database/search?artist=#{artist}"))
    json = JSON.parse(IO.read(Rails.root + 'tmp/response.json'))

    @records = []

    json['results'].each do |record|
      @records.push({title: record['title'], label: record['label']})
    end

    respond_to do |format|
      format.js
    end
  end
end
