class User < ApplicationRecord
  has_many :posts , foreign_key: :creator_id

  has_many :friendships
  has_many :friends, through: :friendships , source: :friend

  has_many :notifications ,foreign_key: :to_user_id

  has_many :comments

  has_one_attached :avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    unless user
      user = User.create(
        name: data['first_name'],
        last_name: data['last_name'],
        email: data['email'],
        password: Devise.friendly_token[0,20]
      )
    end

    return user

  end


end
