class Message < ApplicationRecord
  belongs_to :sender, polymorphic: true
  belongs_to :user
  belongs_to :chatroom
end
