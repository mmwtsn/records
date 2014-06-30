class RecordsController < ApplicationController
  require 'net/http'

  def index
    @records = Record.all
  end

  def show
    record = Record.find(params[:id])
    @record = JSON.parse(Net::HTTP.get('api.discogs.com', "/releases/#{record.discogs_id}"))
  end

  def create
    @record = Record.create!(record_params)
    @records = Record.all

    respond_to do |format|
      format.js
    end
  end

  def search
    artist = params[:artist].split(' ').join('+')

    if Rails.env == 'test'
      @results = IO.read(Rails.root + 'spec/support/response.json')
    else
      @results = Net::HTTP.get('api.discogs.com', "/database/search?artist=#{artist}&per_page=100")
    end

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
