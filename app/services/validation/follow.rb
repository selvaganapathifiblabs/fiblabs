# frozen_string_literal: true

# Followings validation
class Validation::Follow
  def self.check_if_already_following(current_user, following_id)
    Search::User.get_all_user_following_id(current_user, following_id).include?(following_id.to_i)
  end
end
