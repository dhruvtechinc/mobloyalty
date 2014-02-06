class User < ActiveRecord::Base
  require "bcrypt"
  has_many :memberships
  has_many :stores
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  VALID_PHONE_NUM = /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/
  validates :phone_number, allow_blank: true, presence: true, format: { with: VALID_PHONE_NUM } #length: { maximum: 10 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!(:validate => false)
    UserMailer.password_reset(self).deliver
  end

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

    def generate_token(column)
      begin
        puts column
        puts self.inspect
        self[column] = SecureRandom.urlsafe_base64
        puts self[column]
      end while User.exists?(column => self[column])
    end

end