require 'yt/annotations/base'

module Yt
  module Annotations
    # An end screen annotation shows in the last 5 to seconds of the video.
    class EndScreen < Base
      # @param [Hash] json the Hash representation of the XML data returned by
      #   YouTube for each end screen of a video.
      def initialize(json = {})
        @text = json['title']['runs'][0]['text']
        @starts_at = json['startMs'].to_i / 1000.0
        @ends_at = ends_at_in json
        @link = to_link json
      end

    private

      def ends_at_in(json)
        json['endMs'].to_i / 1000.0
      end

      def to_link(json)
        target_url = case json['style']
          when 'WEBSITE'
            json['endpoint']['urlEndpoint']['url']
          when 'PLAYLIST'
            "https://www.youtube.com/watch?v=" +
            json['endpoint']['watchEndpoint']['videoId'] +
            "&list=" +
            json['endpoint']['watchEndpoint']['playlistId']
          when 'VIDEO'
            "https://www.youtube.com/watch?v=" +
            json['endpoint']['watchEndpoint']['videoId']
          when 'CHANNEL'
            if json['isSubscribe']
              "https://www.youtube.com/channel/" +
              json['hovercardButton']['subscribeButtonRenderer']['channelId']
            else
              "https://www.youtube.com/channel/" +
              json['endpoint']['browseEndpoint']["browseId"]
            end
          end
        {
          url: target_url, new_window: new_window(json['style']),
          type: link_type(json)
        }
      end

      def link_type(json)
        case json['style']
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
