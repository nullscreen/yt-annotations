require 'yt/annotations/base'

module Yt
  module Annotations
    # A Pause annotation is like a Note annotation with start/end time,
    # but cannot have a link or text.
    class Pause < Note
    private
      def to_link(url)
        nil
      end
    end
  end
end
