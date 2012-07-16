class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string(:twitter_user, :null => false)
      t.text(:tweeted_text, :null => false)
      t.datetime(:tweeted_at, :null => false)
      t.integer(:user_id, :null => false)
      t.timestamps
    end
  end
end
