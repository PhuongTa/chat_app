class User < ActiveRecord::Base

  before_save{self.email = email.downcase}

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


end
