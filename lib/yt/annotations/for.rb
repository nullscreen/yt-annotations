require 'yt/annotations/branding'
require 'yt/annotations/card'
require 'yt/annotations/featured'
require 'yt/annotations/label'
require 'yt/annotations/note'
require 'yt/annotations/speech'
require 'yt/annotations/spotlight'
require 'yt/annotations/title'
require 'yt/annotations/pause'

module Yt
  module Annotations
    module For
      def for(video_id)
        request = Net::HTTP::Get.new "/annotations_invideo?video_id=#{video_id}"
        options = ['www.youtube.com', 443, {use_ssl: true}]
        response = Net::HTTP.start(*options) {|http| http.request request}
        xml_to_annotations(Hash.from_xml response.body).sort_by &:starts_at
      end

    private

      def xml_to_annotations(xml)
        annotations = xml['document']['annotations']
        annotations = Array.wrap (annotations || {})['annotation']
        annotations = merge_highlights annotations
        annotations = exclude_drawers annotations
        annotations.map{|data| annotation_class(data).new data}
      end


      def annotation_class(data)
        case data['style']
          when 'anchored' then Annotations::Speech
          when 'branding' then Annotations::Branding
          when 'highlightText' then Annotations::Spotlight
          when 'label' then Annotations::Label
          when 'popup' then Annotations::Note
          when 'title' then Annotations::Title
          else case data['type']
            when 'card' then Annotations::Card
            when 'promotion' then Annotations::Featured
            when 'pause' then Annotations::Pause
          end
        end
      end

      def exclude_drawers(annotations)
        annotations.reject{|a| a['type'] == 'drawer'}
      end

      def merge_highlights(annotations)
        highlights, others = annotations.partition{|a| a['type'] == 'highlight'}
        highlights.each do |highlight|
          match = others.find do |a|
            (a['segment'] || {})['spaceRelative'] == highlight['id']
          end
          match.merge! highlight if match
        end
        others
      end
    end
  end
end
