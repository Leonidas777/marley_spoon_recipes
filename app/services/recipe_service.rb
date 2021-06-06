# frozen_string_literal: true

class RecipeService
  class << self
    def get_all
      contentful_client.entries(content_type: 'recipe')
    end

    def get_by_id(id)
      contentful_client.entries('content_type' => 'recipe', 'sys.id' => id).first
    end

    private

    def contentful_client
      @contentful_client ||= Contentful::Client.new(
        space: ENV['CONTENTFUL_SPACE_ID'],
        access_token: ENV['CONTENTFUL_ACCESS_TOKEN'],
        dynamic_entries: :auto
      )
    end
  end
end
