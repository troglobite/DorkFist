module ViewCompatibility
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::UrlHelper

    def url_helper
        Rails.application.routes.url_helpers
    end
end 