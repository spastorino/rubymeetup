class PostPresenter
  attr_reader :ongoing, :upcoming, :this_week, :picks, :ranking

  def initialize
    @ongoing   = Post.with_category('ongoing')
    @upcoming  = Post.with_category('upcoming')
    @this_week = Post.with_category('this_week')
    @picks     = Post.picks
    @ranking   = Post.ranking
  end
end
