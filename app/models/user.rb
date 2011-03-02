class User 
  include ActiveModel::Validations
  include Mongoid::Document
  #include MongoMapper::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable
  devise :omniauthable
  field :name
  field :role

  #attr_accessible :email, :password, :password_confirmation, :remember_me

  ROLES = %w[admin user]

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
   data = access_token['extra']['user_hash']
   #if user = User.find_by_email(data["email"])
   if user = User.find(:first, :conditions => { :email =>  data["email"]})
 
     user
   else # Create an user with a stub password. 
     User.create!(:email => data["email"], :password => Devise.friendly_token[0,20]) 
   end
  end 


end
