# frozen_string_literal: true

class RecipeService
  LIMIT = 2

  class << self
    def get_all(page: 1)
      contentful_client.entries(
        content_type: 'recipe',
        skip:  skip_for_page(page.to_i),
        limit: LIMIT,
        order: 'sys.createdAt'
      )
    end

    def get_by_id(id)
      contentful_client.entries('content_type' => 'recipe', 'sys.id' => id).first
    end

    private

    def contentful_client
      @contentful_client ||= Contentful::Client.new(
        space: ENV['CONTENTFUL_SPACE_ID'],
        access_token: ENV['CONTENTFUL_ACCESS_TOKEN'],
        dynamic_entries: :auto,
        raise_for_empty_fields: false
      )
    end

    def skip_for_page(page)
      page <= 1 ? 0 : (page - 1) * LIMIT
    end
  end
end
