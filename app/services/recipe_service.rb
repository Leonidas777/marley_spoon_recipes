# frozen_string_literal: true

class RecipeService
  LIMIT = 10

  class << self
    def get_all(skip: 0)
      contentful_client.entries(
        content_type: 'recipe',
        skip: skip,
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
  end
end
