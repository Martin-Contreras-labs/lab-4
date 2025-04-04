class Message < ApplicationRecord
    belongs_to :conversation
    belongs_to :user
  
    validates_presence_of :user_id,:conversation_id,:content, presence: true
    
  end
  