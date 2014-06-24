class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :cover
      t.string :label
      t.string :country
      t.integer :year
      t.string :url
      t.string :discogs_id
    end
  end
end
