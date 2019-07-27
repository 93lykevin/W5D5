class CreateVisit < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.string :user_id
      t.string :shortened_url_id

      t.timestamp
    end
    
    add_index :visits, :user_id
    add_index :visits, :shortened_url_id
  end
end
