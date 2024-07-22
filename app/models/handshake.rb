class Handshake < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  validates :status, inclusion: { in: %w[pending accepted rejected] }
end
