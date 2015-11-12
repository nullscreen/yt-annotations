require 'yt/annotations/card'

module Yt
  module Annotations
    # A Featured annotation is similar to a card, except that it displays in
    # the bottom-left corner and only shows if no cards are present.
    class Featured < Card
    private
      def text_in(json)
        json.values_at('text_line_1', 'text_line_2').join(': ')
      end

      def ends_at_in(data)
        data['end_ms'] / 1000.0
      end

      def to_link(data, json)
        return unless url = data.fetch('action', {})['url']
        new_window = url['target'] != 'current'
        {url: url['value'], new_window: new_window, type: link_type(json)}
      end

      def link_type(json)
        if json['playlist_length']
          :playlist
        elsif json['video_duration']
          :video
        end
      end
    end
  end
end
