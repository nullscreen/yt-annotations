require 'yt/annotations/base'

module Yt
  module Annotations
    # A Card annotation is different from a Note annotation in the way data is
    # represented in the XML under a new 'data' key with JSON-formatted content.
    class Card < Base
      # @param [Hash] data the Hash representation of the XML data returned by
      #   YouTube for each card of a video.
      def initialize(data = {})
        json = JSON.parse data['data']
        @text = text_in json
        @starts_at = json['start_ms'] / 1000.0
        @ends_at = ends_at_in json
        @link = to_link data, json
      end

    private

      def text_in(json)
        json['teaser_text']
      end

      def ends_at_in(json)
        (json['start_ms'] + json['teaser_duration_ms']) / 1000.0
      end

      def to_link(data, json)
        link_type = case json['card_type']
          when 'collaborator' then :channel
          when 'playlist' then :playlist
          when 'video' then :video
          when 'merch' then :merch
          when 'fundraising' then :crowdfunding
          when 'associated' then :website
        end

        {url: json['url'], new_window: true, type: link_type}
      end
    end
  end
end
