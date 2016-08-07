class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # database_authenticatable, :validatable,
  # :confirmable, :lockable, :timeoutable, :registerable,
  # :recoverable, :rememberable
  devise :trackable, :omniauthable

 def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_initialize
    user.token = auth.credentials.token
    user.save
    user
  end
end
