class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_many :sent_handshakes, class_name: 'Handshake', foreign_key: 'sender_id'
  has_many :received_handshakes, class_name: 'Handshake', foreign_key: 'receiver_id'
end
