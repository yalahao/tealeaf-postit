class Post < ActiveRecord::Base
  include Voteable
  include Sluggable

  sluggable_column :title

  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories

  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true, uniqueness: true
  validates :creator, presence: true



end