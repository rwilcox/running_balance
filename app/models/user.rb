class User < ActiveRecord::Base
  #include SimpleEav
  #configure_simple_eav :preference_attributes
  # TODO: I want to use SimpleEav, but it has some issues that need working through
  # (Rails 3.1 support) before I can use it here. WD-rpw 08-14-2011

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :accounts # bank accounts...

  before_save :ensure_authentication_token

  def self.find_for_google_openid(access_token, signed_in_resource=nil)
    data = access_token['user_info']
    if user = User.find_by_email(data["email"])
      user
    else # Create a user with a stub password. 
      User.create(:email => data["email"], :password => Devise.friendly_token[0,20]) 
    end
  end
end
