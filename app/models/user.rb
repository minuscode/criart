class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  validates :username, :presence => true

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me

  has_many :orders

  #puts request.env["omniauth.auth"]
  #puts "HELLO #{request.env["omniauth.auth"][:info][:first_name]}"

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = User.find_by_email(data.email)
      puts "FOUND USER WITH EMAIL: #{data.email}"
      user
    else # Create a user with a stub password.
      #User.create!(:email => data.email, :encrypted_password => Devise.friendly_token[0,20])
      puts "CREATED NEW USER WITH EMAIL: #{data.email}"
      user = User.new(:username => data.first_name, :email => data.email, :encrypted_password => Devise.friendly_token[0,20])
      user.save
      user
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["user_hash"]
        user.email = data["email"]
      end
    end
  end

end

=begin
#<OmniAuth::AuthHash
credentials=#<Hashie::Mash expires=false token="AAACBiC4dGWsBAL9lznsFyGBS7W9rh5oh9I2Lp4isNlUnAM0m1qG5j2K6mXOWLskXjIoS3nt6eXzvqZCZCBximfPqXLZCZBnp20ZASxLAykgZDZD"> extra=#<Hashie::Mash raw_info=#<Hashie::Mash
education=[#<Hashie::Mash concentration=[#<Hashie::Mash id="110858552321534" name="Engenharia Informática">] school=#<Hashie::Mash id="107802119240565" name="Faculdade de Ciências e Tecnologia da Universidade Nova de Lisboa"> type="College" year=#<Hashie::Mash id="141778012509913" name="2008">>]
email="miguel.marinhas@gmail.com" first_name="Miguel" gender="male" id="100000294577292" last_name="Marinhas" link="http://www.facebook.com/profile.php?id=100000294577292" locale="en_US" name="Miguel Marinhas" updated_time="2011-05-30T23:24:53+0000" verified=true>> info=#<OmniAuth::AuthHash::InfoHash email="miguel.marinhas@gmail.com" first_name="Miguel" image="http://graph.facebook.com/100000294577292/picture?type=square" last_name="Marinhas" name="Miguel Marinhas" urls=#<Hashie::Mash Facebook="http://www.facebook.com/profile.php?id=100000294577292">> provider="facebook" uid="100000294577292">
=end