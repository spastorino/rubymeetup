class Post < ActiveRecord::Base
  belongs_to :post

  scope :picks, -> { where(featured: true).order(:priority) }
  scope :ranking, -> { order(:like_count) }

  def self.with_category(name)
    where(category: name)
  end
end
