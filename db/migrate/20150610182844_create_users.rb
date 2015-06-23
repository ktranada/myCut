class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false
      t.string :photo_url
      t.string :thumb_url, default: "http://res.cloudinary.com/mycut/image/upload/c_fill,h_120,r_max,w_120/v1434910961/default_avatar.jpg"

      t.timestamps null: false
    end
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
    add_index :users, :session_token, unique: true

  end
end
