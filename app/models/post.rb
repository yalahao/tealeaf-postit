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

  before_save :generate_slug

  def to_param
    "#{slug}"
  end

  def generate_slug
    the_slug = self.title.parameterize
    post = Post.find_by slug: the_slug
    while post && post != self
      the_slug = append_suffix(the_slug)
      post = Post.find_by slug: the_slug
    end
    self.slug = the_slug
  end

  def append_suffix(str)
    str_last = str.split('-').last.to_i
    if str_last != 0
      return str.split('-').slice(0...-1).join('-') + '-' + (str_last + 1).to_s
    else 
      return str + '-2' 
    end
  end

end