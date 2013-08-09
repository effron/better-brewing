# == Schema Information
#
# Table name: friendships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  friend_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Friendship < ActiveRecord::Base
  attr_accessible :friend_id, :user_id

  belongs_to :user
  belongs_to :friend, class_name: "User", foreign_key: :friend_id
end

