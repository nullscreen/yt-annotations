require 'yt/annotations/base'

module Yt
  module Annotations
    # A Title annotation is like a Note annotation with text, start/end time,
    # but cannot have a link. It's simply overlay text.
    class Title < Note
    private
      def to_link(url)
        nil
      end
    end
  end
end
