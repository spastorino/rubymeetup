module Services
  class PostService
    def initialize
    end

    def save_features(featured_picks_ids)
      query = PostQuery.new(featured_picks_ids)
      query.unfeature_all

      if featured_picks_ids.present?
        query.each do |f, i|
          f.featured = true
          f.priority = i
          f.save
        end
      end
    end
  end

  class PostQuery
    def initialize(featured_picks_ids)
      @featured_picks_ids = featured_picks_ids
    end

    def each(&block)
      featured_picks = Post.find(@featured_picks_ids).sort_by{|p| @featured_picks_ids.index(p.id.to_s) }
      featured_picks.each_with_index(&block)
    end

    def unfeature_all
      Post.where(:featured => true).update_all(:featured => false, :priority => nil)
    end
  end
end
