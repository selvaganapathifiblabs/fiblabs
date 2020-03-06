# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets
  has_many :follower_mapping, class_name: :Follow, foreign_key: :following_id, dependent: :destroy
  has_many :followers, through: :follower_mapping, source: :follower
  has_many :following_mapping, class_name: :Follow, foreign_key: :follower_id, dependent: :destroy
  has_many :followings, through: :following_mapping, source: :following
end
