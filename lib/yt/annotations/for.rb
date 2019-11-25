require 'yt/annotations/branding'
require 'yt/annotations/card'
require 'yt/annotations/end_screen'

# An object-oriented Ruby client for YouTube.
# @see http://www.rubydoc.info/gems/yt/
module Yt
  module Annotations
    # Provides a method to fetch annotations and cards for a YouTube video.
    module For
      # @param [String] video_id the unique ID of a YouTube video.
      # @return [Array<Yt::Annotation>] the annotations/end cards of the video.
      def for(video_id)
        (annotations(video_id) + end_screens(video_id)).sort_by(&:starts_at)
      end

    private

      def annotations(video_id)
        data = fetch "/annotations_invideo?video_id=#{video_id}"
        xml_to_annotations(Hash.from_xml data)
      end

      def end_screens(video_id)
        data = fetch "/get_endscreen?v=#{video_id}"
        data = data.partition("\n").last
        data.present? ? json_to_annotations(JSON data) : []
      end

      def fetch(path)
        request = Net::HTTP::Get.new path
        options = ['www.youtube.com', 443, {use_ssl: true}]
        response = Net::HTTP.start(*options) {|http| http.request request}
        response.body
      end

      def xml_to_annotations(xml)
        annotations = xml['document']['annotations']
        annotations = Array.wrap (annotations || {})['annotation']
        annotations = exclude_drawers annotations
        annotations.map{|data| annotation_class(data).new data}
      end

      def json_to_annotations(json)
        annotations = json['elements']
        annotations.map{|data| Annotations::EndScreen.new data['endscreenElementRenderer']}
      end

      def annotation_class(data)
        case data['style']
          when 'branding' then Annotations::Branding
          else
            case data['type']
            when 'card' then Annotations::Card
          end
        end
      end

      def exclude_drawers(annotations)
        annotations.reject{|a| a['type'] == 'drawer'}
      end
    end
  end
end
