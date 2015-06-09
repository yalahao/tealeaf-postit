module Sluggable
  extend ActiveSupport::Concern

  included do
    before_save :generate_slug
    class_attribute :slug_column
  end

  module ClassMethods
    def sluggable_column(col_name)
      self.slug_column = col_name
    end
  end

  def to_param
    "#{slug}"
  end

  def generate_slug
    the_slug = self.send(self.class.slug_column.to_sym).parameterize
    obj = self.class.find_by slug: the_slug
    while obj && obj != self
      the_slug = append_suffix(the_slug)
      obj = self.class.find_by slug: the_slug
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