require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  setup do
    %w(Business Personal Money Sports).each do |title|
      Category.create!(title: title)
      end

  end

  test("suggested categories works correctly") do
    tweet =Tweet.new do |t|
      t.tweeted_text = "I wish could watch sports all day at business"
    end
    assert_equal("Business, Sports", tweet.suggested_categories)
  end

end
