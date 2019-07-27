class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, uniqueness: true
      t.timestamps
    end
    
    add_index :users, :email
  end
end
