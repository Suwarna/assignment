class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  has_one  :picture, :as => :pictureable
  validates_presence_of :firstname, :lastname

  def self.from_omniauth(auth, role)
    if user = User.where(:email => auth["info"]["email"]).first
      user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.firstname = auth.info.first_name
        user.lastname = auth.info.last_name
      end
    end
  end

end
