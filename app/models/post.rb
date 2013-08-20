class Post < ActiveRecord::Base
  belongs_to :post

  def self.unfeature_all
    where(:featured => true).update_all(:featured => false, :priority => nil)
  end
end
