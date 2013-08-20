class PostPresenter
  def initialize
    @post_query = PostQuery.new
  end

  def ongoing
    @ongoing ||= @post_query.ongoing
  end

  def upcoming
    @upcoming ||= @post_query.upcoming
  end

  def this_week
    @this_week ||= @post_query.this_week
  end

  def picks
    @picks ||= @post_query.picks
  end

  def ranking
    @ranking ||= @post_query.ranking
  end
end
