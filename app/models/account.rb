class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_writer :login
  
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, 
  :omniauthable, omniauth_providers: [:google_oauth2]
  
  mount_uploader :image, ImageUploader

  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  has_many :posts

  def total_followers
    0
  end

  def total_following
    0
  end

  def login
    @login || self.username || self.email
  end
  
  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |account|
      account.username = provider_data.info.first_name
      account.email = provider_data.info.email
      account.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end 

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end