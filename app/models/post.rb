class Post < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :votes, as: :voteable

  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true, uniqueness: true
  validates :creator, presence: true

  def generate_slug
    self.slug = self.title.parameterize
    self.save
  end

end