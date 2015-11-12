require 'net/http'
require 'json'
require 'active_support' # required
require 'active_support/core_ext/hash/conversions' # for Hash.from_xml
require 'active_support/core_ext/string/inflections' # for demodulize

require 'yt/annotations/for'

module Yt
  module Annotations
    # Auto-load For to have the easy syntax Yt::Annotations.for(video_id).
    extend For
  end
end
