class PostsPresenter
  def ongoing
    Post.by_category 'ongoing'
  end

  def upcoming
    Post.by_category 'upcoming'
  end

  def this_week
    Post.by_category 'this_week'
  end

  def picks
    Post.by_picks
  end

  def ranking
    Post.like_counts
  end
end
