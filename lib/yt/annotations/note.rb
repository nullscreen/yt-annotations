require 'yt/annotations/base'

module Yt
  module Annotations
    # A Note annotation is just a basic annotation with text, start/end time
    # and an optional link. It's shaped like a Post-It with a curved corner.
    class Note < Base
      # @param [Hash] data the Hash representation of the XML data returned by
      #   YouTube for each annotation of a video.
      def initialize(data = {})
        @text = data['TEXT']
        @starts_at = to_seconds regions_of(data)[0]['t']
        @ends_at = to_seconds regions_of(data)[1]['t']
        @link = to_link data.fetch('action', {})['url']
      end

    private

      def regions_of(data)
        data['segment']['movingRegion']['rectRegion']
      end

      def to_seconds(timestamp)
        timestamp.split(':').map(&:to_f).inject(0) {|sum, n| 60 * sum + n}
      end

      def to_link(url)
        return unless url
        new_window = url['target'] != 'current'
        type = case url['link_class']
          when '1' then :video
          when '2' then :playlist
          when '3' then :channel
          when '4' then :profile
          when '5' then :subscribe
          when '6' then :website
          when '8' then :crowdfunding
        end
        {url: url['value'], new_window: new_window, type: type}
      end
    end
  end
end

