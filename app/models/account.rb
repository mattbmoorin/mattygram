class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, 
  :omniauthable, omniauth_providers: [:google_oauth2]
  
  has_many :posts, dependent: :destroy
  
  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |account|
      account.username = provider_data.info.first_name
      account.email = provider_data.info.email
      account.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end 
end