class CreateShortenedUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_urls do |t|
      t.integer :user_id, null: false
      t.string :long_url, uniqueness: true
      t.string :short_url
    end
  end
end
