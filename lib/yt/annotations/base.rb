module Yt
  module Annotations
    # An abstract class with common attributes for every type of annotation.
    class Base
      # @return [String] the text of the annotation.
      attr_reader :text

      # @return [Float] when the annotation appears (in seconds).
      attr_reader :starts_at

      # @return [Float] when the annotation disappears (in seconds).
      attr_reader :ends_at

      # @return [Hash, nil] what the annotation links.
      attr_reader :link
    end
  end
end
