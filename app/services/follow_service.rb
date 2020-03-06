# frozen_string_literal: true

# User follow and unfollow
class FollowService
  def self.follow_user(current_user, following_id)
    following = current_user.following_mapping.new
    following.following_id = following_id
    following.save
  end

  def self.unfollow_user(current_user, unfollowing_id)
    unfollow = current_user.following_mapping.find_by(following_id:unfollowing_id)
    if unfollow
      unfollow.delete
      true
    else
      false
    end
  end
end
