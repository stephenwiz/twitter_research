class Tweet < ActiveRecord::Base
  # attr_accessible :title, :body

  attr_accessible(:twitter_user, :tweeted_text, :tweeted_at, :user_id)

  validates(:twitter_user, :presence => true)
  #  validates(:tweeted_text, :presence => true)
  validates(:tweeted_at, :presence => true)


  belongs_to(:user)
  has_and_belongs_to_many(:categories)

  def suggested_categories
    #String#split              newstring1 = String.split()  takes a string and converts each word into an array
    #String#downcase           newstring2 = newstring1.downcase
    #Array#join         takes an array, and converts it into a long string.
    #Array#inject
    #text = tweeted_text.gsub(#/,'')  #removes the #, replaces with a ''.
    #titles = Category.all.map(&:title).map(&:downcase)    create an array of lowercase categories.
    #titles.include?(word)  true/false returns.  if it matches your categories so need to loop through?

    text = tweeted_text.gsub(/#/, '').downcase.split
    titles = Category.all.map(&:title).map(&:downcase)
    catmatch = text & titles
    suggestion = catmatch.map(&:capitalize)
    suggestion.sort.join(', ')
  end

  def categories_as_string
    # returns a comma separated string of the current category titles.
    categories.map(&:title).sort.join(', ')

  end

  def categories_as_string= (new_categories)
    # given a comma separated string of category titles, reset the
    # categories for this tweet to the categories in the string.
    categories.clear

    new_categories.split(/\s*,\s*/).each do |title|
      cat = Category.where('LOWER(title) = ?', title.downcase).first
      categories << cat if cat

    end
  end

end


