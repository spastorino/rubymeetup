require 'test_helper'

class PostPresenterTest < ActiveSupport::TestCase
  setup do
    @post_presenter = PostPresenter.new
  end

  %w[ongoing upcoming this_week picks ranking].each do |name|
    test "should return #{name}" do
      assert @post_presenter.send(name)
    end
  end
end
