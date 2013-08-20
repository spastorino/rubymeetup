class FeaturedPostService
  def self.save_picks(pick_ids)
    Post.unfeature_all
    feature_picks!(pick_ids) if pick_ids.present?
  end

  private

  def self.feature_picks!(pick_ids)
    picks = Post.find(pick_ids)
    picks.each do |post|
      i = pick_ids.index(post.id.to_s)
      post.featured = true
      post.priority = i
      post.save
    end
  end
end
