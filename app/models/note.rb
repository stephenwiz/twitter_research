class Note < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible(:note_text, :user_id, :tweet_id)

  validates(:note_text, :presence => true)
#  validates(:user_id, :presence => true)
#  validates(:tweet_id, :presence => true)


  belongs_to (:tweet)       #rails adds the _id to the end
  belongs_to(:user)

end
