class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_secure_password validations: false
  has_many :votes

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 8}, on: :create

  before_save :generate_slug

  def admin?
    self.role.to_sym == :admin if !self.role.nil?
  end

  def to_param
    self.slug
  end

  private

  def generate_slug
    self.slug = self.username.gsub(' ', '').downcase
  end
end