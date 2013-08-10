class User < ActiveRecord::Base

  #before_save{self.email = email.downcase}
  before_save{ email.downcase! }
  before_create :create_remember_token

  attr_accessible :email, :name,:password, :password_confirmation

  # Validating presence :name & :email
  # name : presence + length
  validates :name, presence: true, length: {maximum: 50}

  # email: presence + format + uniqueness #kiem tra trung
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-_]+(\.[a-z]+)*\.[a-z]{1,3}\z/i
  validates :email, presence: true, 
  					format:{ with: VALID_EMAIL_REGEX},
  					uniqueness: {case_sensitive: false}

  #check password == password_confirmation
  has_secure_password
  validates :password, length: {minimum: 6}

  # Define Method
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

      def create_remember_token
        self.remember_token = User.encrypt(User.new_remember_token)
      end
end
