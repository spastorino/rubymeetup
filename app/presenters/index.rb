module Presenters
  class Index
    attr_reader :ongoing, :upcoming, :this_week, :picks, :ranking

    def initialize
      @ongoing = Post.where(:category => 'ongoing')
      @upcoming = Post.where(:category => 'upcoming')
      @this_week = Post.where(:category => 'this_week')
      @picks = Post.where(:featured => true).order(:priority)
      @ranking = Post.order(:like_count)
    end
  end
end
