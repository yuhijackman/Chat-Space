class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :nickname, presence: true
  has_many :group_users
  has_many :chats
  has_many :groups, through: :group_users
  accepts_nested_attributes_for :groups
end
