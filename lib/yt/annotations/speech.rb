require 'yt/annotations/note'

module Yt
  module Annotations
    # A Speech annotation is like a NOT annotation with text, start/end time
    # and an optional link, but it's shaped like a speech bubble.
    class Speech < Note
    private
      def regions_of(data)
        data['segment']['movingRegion']['anchoredRegion']
      end
    end
  end
end
