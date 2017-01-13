require 'yt/annotations/base'

module Yt
  module Annotations
    # An end screen annotation shows in the last 5 to seconds of the video.
    class EndScreen < Base
      # @param [Hash] data the Hash representation of the XML data returned by
      #   YouTube for each end screen of a video.
      def initialize(json = {})
        @text = json['title']
        @starts_at = json['startMs'] / 1000.0
        @ends_at = ends_at_in json
        @link = to_link json
      end

    private

      def ends_at_in(json)
        (json['startMs'] + json['durationMs']) / 1000.0
      end

      def to_link(json)
        {
          url: json['targetUrl'], new_window: new_window(json['type']), 
          type: link_type(json)
        }
      end
      
      def link_type(json)
        case json['type']
          when 'WEBSITE' then :website
          when 'PLAYLIST' then :playlist
          when 'VIDEO' then :video
          when 'CHANNEL' then (json['isSubscribe'] ? :subscribe : :channel)
        end
      end
      
      def new_window(type)
        %w(WEBSITE CHANNEL).include? type
      end
    end
  end
end
