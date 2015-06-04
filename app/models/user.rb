class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :votes

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 3}

  before_save :generate_slug

  def generate_slug
    self.slug = self.username.parameterize
  end

  def to_param
    "#{slug}"
  end

end