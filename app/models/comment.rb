class Comment < ApplicationRecord
  belongs_to :topic
  
  validates :content, presence: true
  validates :topic_id, presence: true
  
end
