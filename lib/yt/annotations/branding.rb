require 'yt/annotations/card'

module Yt
  module Annotations
    # A Branding annotation is similar to a card, except that it does not have
    # text, only a channel-linked image displayed in the bottom-right corner.
    class Branding < Card
    private
      def text_in(data)
        ''
      end

      def ends_at_in(data)
        data['end_ms'] / 1000.0
      end

      def to_link(data, json)
        return unless url = data.fetch('action', {})['url']
        new_window = url['target'] != 'current'
        {url: url['value'], new_window: new_window, type: :channel}
      end
    end
  end
end
