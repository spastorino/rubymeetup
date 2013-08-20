class PostQuery
  def ongoing
    Post.where(:category => 'ongoing')
  end

  def upcoming
    Post.where(:category => 'upcoming')
  end

  def this_week
    Post.where(:category => 'this_week')
  end

  def picks
    Post.where(:featured => true).order(:priority)
  end

  def ranking
    Post.order(:like_count)
  end
end
