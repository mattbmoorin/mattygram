class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: [:google_oauth2]

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |account|
      account.email = provider_data.info.email
      account.password = Devise.friendly_token[0, 20]
    end
  end 
end
    
    
    
    
    
  #   .from_omniauth(access_token)
  #   data = access_token.info
  #   account = account.where(email: data['email']).first

  #   # Uncomment the section below if you want accounts to be created if they don't exist
  #   unless account
  #       account = account.create(
  #        name: data['name'],
  #        email: data['email'],
  #        password: Devise.friendly_token[0,20]
  #       )
  #   end
  #   account
  # end

  # def self.from_google(email:, full_name:, uid:, avatar_url:)
  #   return nil unless email =~ /@mybusiness.com\z/
  #   create_with(uid: uid, full_name: full_name, avatar_url: avatar_url).find_or_create_by!(email: email)
  # end
