class Post < ActiveRecord::Base
  belongs_to :post

  def self.by_category(value)
    where(:category => value)
  end

  def self.by_picks
    where(:featured => true).order(:priority)
  end

  def self.like_counts
    order(:like_count)
  end

  def self.toggle_feature(picks)
    unfeature_all!
    feature(picks) if picks.present?
  end

  def self.unfeature_all!
    where(:featured => true).update_all(:featured => false, :priority => nil)
  end

  def self.feature(picks)
    find(picks).each do |p|
      p.update_attributes :featured => true, :priority => picks.index(p.id)
    end
  end
end
