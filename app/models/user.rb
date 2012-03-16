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

  # begin -- upgrade to rails 3.1 / devise 2

  ## Database authenticatable
  field :email,              :type => String, :null => false
  field :encrypted_password, :type => String, :null => false

  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String
  
  ## Encryptable
  # field :password_salt, :type => String

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  # Token authenticatable
  # field :authentication_token, :type => String

  ## Invitable
  # field :invitation_token, :type => String
  
  # end -- upgrade to rails 3.1 / devise 2
  

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
