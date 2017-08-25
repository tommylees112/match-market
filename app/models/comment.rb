class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :match
  validates :content, length: { minimum: 10 }
end
