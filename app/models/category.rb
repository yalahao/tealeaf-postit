class Category < ActiveRecord::Base
  has_many :post_categories
  has_many :posts, through: :post_categories

  validates :name, presence: true

  before_save :generate_slug

  def generate_slug
    self.slug = self.name.parameterize
  end

  def to_param
    "#{slug}"
  end

end