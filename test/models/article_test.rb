require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "should not save without title" do
    article = Article.new
    assert_not article.save, "Saved the article without a title"
  end

  test "Should save with a title" do
    article = Article.new(title: "This is a test", user_id: "1")
    assert article.save
  end

end
