class User < ActiveRecord::Base
  has_many :fav_producers
  has_many :producers, through: :fav_producers
  has_many :fav_whiskies
  has_many :whiskies, through: :fav_whiskies

  has_secure_password

  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates_format_of :email, :with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i, :multiline => true
  validates :password, confirmation: true, presence: true, :length => {:minimum => 6}, on: :create
  validates :password_confirmation, presence: true, on: :create

  def set_password_reset
    self.code = SecureRandom.urlsafe_base64
    self.expires_at = 4.hours.from_now
    self.save!
  end

  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate,password)
  end

end
