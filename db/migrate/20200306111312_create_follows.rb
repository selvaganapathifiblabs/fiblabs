# frozen_string_literal: true

class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.bigint :following_id, null: false, foreign_key: true
      t.bigint :follower_id, null: false, foreign_key: true
      t.timestamps
    end
    add_index :follows, :following_id
    add_index :follows, :follower_id
  end
end
