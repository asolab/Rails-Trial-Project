class User < ApplicationRecord

  #validates :email, presence: true, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: [:github, :google_oauth2]

         has_many :friends 

     

         
        
         def self.from_omniauth(access_token)
    user = User.where(email: access_token.info.email).first
    unless user
         user = User.create(
            email: access_token.info.email,
            password: Devise.friendly_token[0,20]
         )
     end
     user.name = access_token.info.name
     user.image = access_token.info.image
     user.uid = access_token.uid
     user.provider = access_token.provider
     user.skip_confirmation!
     user.save!
     user
end
end