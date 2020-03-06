# frozen_string_literal: true

# Searching tweets for user followings
class Search::Tweet
  def self.get_wall_tweets_for_current_user(current_user)
    current_user.followings.joins(:tweets).order('tweets.created_at DESC').select(:id, :email, :post)
  end
end
