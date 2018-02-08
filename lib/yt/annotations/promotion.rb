require 'yt/annotations/base'

module Yt
  module Annotations
    # A Promotion annotation. The CTA overlay is used more for paid campaigns
    # because the video has to be attached to an adsense account to be used.
    class Promotion < Base
      # @param [Hash] data the Hash representation of the XML data returned by
      #   YouTube for each annotation of a video.
      def initialize(data = {})
        json = JSON.parse data['data']
        @text = text_in json
        @starts_at = json['start_ms'].to_i / 1000.0
        @ends_at = json['end_ms'].to_i / 1000.0
        @link = to_link data.fetch('action', {})['url'], data
      end

    private

      def text_in(json)
        json.values_at('text_line_1', 'text_line_2').join(': ')
      end

      def to_link(url, data)
        new_window = url['target'] == 'new'
        {url: url['value'], new_window: new_window, type: :website}
      end
    end
  end
end
