require "article_controller"

describe Article do

    describe "Create Article" do
        context "Given a valid title and body" do
            it "redirect to the article" do
                expect(Article.create())
            end
        end
    end
end