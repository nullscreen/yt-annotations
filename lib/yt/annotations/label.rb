require 'yt/annotations/note'

module Yt
  module Annotations
    # A Label annotation is just a Note annotation with text, start/end time
    # and an optional link, but shaped like a rectangle without borders.
    class Label < Note
    end
  end
end
