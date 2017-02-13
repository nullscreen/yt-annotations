require 'spec_helper'

describe Yt::Annotations do
  let(:annotations) { Yt::Annotations.for video_id }

  context 'given a video with cards' do
    let(:video_id) { 'MsZtGuBU3vA' }

    it 'returns all the annotations and cards' do
      expect(annotations.size).to be 17

      expect(annotations[0]).to be_a Yt::Annotations::Speech
      expect(annotations[0].starts_at).to be 0.0
      expect(annotations[0].ends_at).to be 1.0
      expect(annotations[0].text).to eq 'n0'
      expect(annotations[0].link).to be_nil

      expect(annotations[1]).to be_a Yt::Annotations::Speech
      expect(annotations[1].starts_at).to be 1.0
      expect(annotations[1].ends_at).to be 2.0
      expect(annotations[1].text).to eq 'n1'
      expect(annotations[1].link).to be_a Hash
      expect(annotations[1].link[:url]).to include 'v=3JNLwlcPBPI'
      expect(annotations[1].link[:type]).to be :video
      expect(annotations[1].link[:new_window]).to be false

      expect(annotations[2]).to be_a Yt::Annotations::Card
      expect(annotations[2].starts_at).to be 1.115
      expect(annotations[2].ends_at).to be 8.115
      expect(annotations[2].text).to include "EXCLUSIVE: 'Finding Dory' Trailer"
      expect(annotations[2].link).to be_a Hash
      expect(annotations[2].link[:url]).to include 'v=3JNLwlcPBPI'
      expect(annotations[2].link[:type]).to be :video
      expect(annotations[2].link[:new_window]).to be true

      expect(annotations[3]).to be_a Yt::Annotations::Note
      expect(annotations[3].starts_at).to be 2.0
      expect(annotations[3].ends_at).to be 3.0
      expect(annotations[3].text).to eq 'n2'
      expect(annotations[3].link).to be_nil

      expect(annotations[4]).to be_a Yt::Annotations::Note
      expect(annotations[4].starts_at).to be 3.0
      expect(annotations[4].ends_at).to be 4.0
      expect(annotations[4].text).to eq 'n3'
      expect(annotations[4].link).to be_a Hash
      expect(annotations[4].link[:url]).to include 'list=PLuW4g7xujBWfU26JUTW1DGs3hk4LD5KaL'
      expect(annotations[4].link[:type]).to be :playlist
      expect(annotations[4].link[:new_window]).to be true

      expect(annotations[5]).to be_a Yt::Annotations::Title
      expect(annotations[5].starts_at).to be 4.0
      expect(annotations[5].ends_at).to be 5.0
      expect(annotations[5].text).to eq 'n4'
      expect(annotations[5].link).to be_nil

      expect(annotations[6]).to be_a Yt::Annotations::Spotlight
      expect(annotations[6].starts_at).to be 5.0
      expect(annotations[6].ends_at).to be 6.0
      expect(annotations[6].text).to eq 'n5'
      expect(annotations[6].link).to be_nil

      expect(annotations[7]).to be_a Yt::Annotations::Spotlight
      expect(annotations[7].starts_at).to be 6.0
      expect(annotations[7].ends_at).to be 7.0
      expect(annotations[7].text).to eq 'n6'
      expect(annotations[7].link).to be_a Hash
      expect(annotations[7].link[:url]).to include 'youtube.com/user/TheEllenShow'
      expect(annotations[7].link[:type]).to be :channel
      expect(annotations[7].link[:new_window]).to be false

      expect(annotations[8]).to be_a Yt::Annotations::Label
      expect(annotations[8].starts_at).to be 7.0
      expect(annotations[8].ends_at).to be 8.0
      expect(annotations[8].text).to eq 'n7'
      expect(annotations[8].link).to be_nil

      expect(annotations[9]).to be_a Yt::Annotations::Label
      expect(annotations[9].starts_at).to be 8.0
      expect(annotations[9].ends_at).to be 9.0
      expect(annotations[9].text).to eq 'n8'
      expect(annotations[9].link).to be_a Hash
      expect(annotations[9].link[:url]).to include 'https://plus.google.com/u/0/103024385626973477082'
      expect(annotations[9].link[:type]).to be :profile
      expect(annotations[9].link[:new_window]).to be true

      expect(annotations[10]).to be_a Yt::Annotations::Card
      expect(annotations[10].starts_at).to be 8.038
      expect(annotations[10].ends_at).to be 15.038
      expect(annotations[10].text).to include 'Adorable Kids'
      expect(annotations[10].link).to be_a Hash
      expect(annotations[10].link[:url]).to include 'list=PLuW4g7xujBWfU26JUTW1DGs3hk4LD5KaL'
      expect(annotations[10].link[:type]).to be :playlist
      expect(annotations[10].link[:new_window]).to be true

      expect(annotations[11]).to be_a Yt::Annotations::Label
      expect(annotations[11].starts_at).to be 9.0
      expect(annotations[11].ends_at).to be 10.0
      expect(annotations[11].text).to eq 'n9'
      expect(annotations[11].link).to be_a Hash
      expect(annotations[11].link[:url]).to include 'youtube.com/user/TheEllenShow'
      expect(annotations[11].link[:type]).to be :subscribe
      expect(annotations[11].link[:new_window]).to be true

      expect(annotations[12]).to be_a Yt::Annotations::Label
      expect(annotations[12].starts_at).to be 10.0
      expect(annotations[12].ends_at).to be 11.0
      expect(annotations[12].text).to eq 'n10'
      expect(annotations[12].link).to be_a Hash
      expect(annotations[12].link[:url]).to include 'causes.com'
      expect(annotations[12].link[:type]).to be :crowdfunding
      expect(annotations[12].link[:new_window]).to be true

      expect(annotations[13]).to be_a Yt::Annotations::Card
      expect(annotations[13].starts_at).to be 15.038
      expect(annotations[13].ends_at).to be 22.038
      expect(annotations[13].text).to eq 'Card with link to channel'
      expect(annotations[13].link).to be_a Hash
      expect(annotations[13].link[:url]).to include 'youtube.com/user/TheEllenShow'
      expect(annotations[13].link[:type]).to be :channel
      expect(annotations[13].link[:new_window]).to be true

      expect(annotations[14]).to be_a Yt::Annotations::Card
      expect(annotations[14].starts_at).to be 22.192
      expect(annotations[14].ends_at).to be 29.192
      expect(annotations[14].text).to eq 'Cards link to Merch site'
      expect(annotations[14].link).to be_a Hash
      expect(annotations[14].link[:url]).to include 'bandcamp.com'
      expect(annotations[14].link[:type]).to be :website
      expect(annotations[14].link[:new_window]).to be true

      expect(annotations[15]).to be_a Yt::Annotations::Branding
      expect(annotations[15].starts_at).to be 30.0
      expect(annotations[15].ends_at).to be 37.0
      expect(annotations[15].text).to be_empty
      expect(annotations[15].link).to be_a Hash
      expect(annotations[15].link[:url]).to include 'youtube.com/channel/UCwCnUcLcb9-eSrHa_RQGkQQ'
      expect(annotations[15].link[:type]).to be :channel
      expect(annotations[15].link[:new_window]).to be true

      expect(annotations[16]).to be_a Yt::Annotations::Card
      expect(annotations[16].starts_at).to be 30.038
      expect(annotations[16].ends_at).to be 37.038
      expect(annotations[16].text).to eq 'Card links to Crowdfunding'
      expect(annotations[16].link).to be_a Hash
      expect(annotations[16].link[:url]).to include 'causes.com'
      expect(annotations[16].link[:type]).to be :website
      expect(annotations[16].link[:new_window]).to be true
    end
  end

  context 'given a video with an end screen' do
    let(:video_id) { 'NNUlOLaupuw' }

    it 'returns all the end screen annotations' do
      expect(annotations.size).to be 5 # [0] is Featured

      expect(annotations[1]).to be_a Yt::Annotations::EndScreen
      expect(annotations[1].starts_at).to be 25.312
      expect(annotations[1].ends_at).to be 35.005
      expect(annotations[1].text).to eq 'PewDiePie'
      expect(annotations[1].link).to be_a Hash
      expect(annotations[1].link[:url]).to eq 'https://www.youtube.com/user/PewDiePie'
      expect(annotations[1].link[:type]).to be :channel
      expect(annotations[1].link[:new_window]).to be true

      expect(annotations[2]).to be_a Yt::Annotations::EndScreen
      expect(annotations[2].starts_at).to be 25.962
      expect(annotations[2].ends_at).to be 35.005
      expect(annotations[2].text).to eq 'T-Shirt Shop for Geeks, Gamer, Nerds'
      expect(annotations[2].link).to be_a Hash
      expect(annotations[2].link[:url]).to eq 'https://3dsupply.de/en/'
      expect(annotations[2].link[:type]).to be :website
      expect(annotations[2].link[:new_window]).to be true

      expect(annotations[3]).to be_a Yt::Annotations::EndScreen
      expect(annotations[3].starts_at).to be 26.741
      expect(annotations[3].ends_at).to be 35.015
      expect(annotations[3].text).to eq 'PSY - GANGNAM STYLE(강남스타일) M/V'
      expect(annotations[3].link).to be_a Hash
      expect(annotations[3].link[:url]).to eq 'https://www.youtube.com/watch?v=9bZkp7q19f0'
      expect(annotations[3].link[:type]).to be :video
      expect(annotations[3].link[:new_window]).to be false

      expect(annotations[4]).to be_a Yt::Annotations::EndScreen
      expect(annotations[4].starts_at).to be 27.287
      expect(annotations[4].ends_at).to be 35.031
      expect(annotations[4].text).to eq 'First public playlist'
      expect(annotations[4].link).to be_a Hash
      expect(annotations[4].link[:url]).to include 'list=PL-LeTutc9GRKD3yBDhnRF_yE8UTaQI5Jf'
      expect(annotations[4].link[:type]).to be :playlist
      expect(annotations[4].link[:new_window]).to be false
    end
  end

  context 'given a video without cards and with a featured playlist' do
    let(:video_id) { 'GFxm7khsS3g' }

    it 'also returns the featured playlist' do
      expect(annotations.size).to be 1

      expect(annotations[0]).to be_a Yt::Annotations::Featured
      expect(annotations[0].starts_at).to be 1.0
      expect(annotations[0].ends_at).to be 5.0
      expect(annotations[0].text).to eq 'Check this playlist: Adorable Kids'
      expect(annotations[0].link).to be_a Hash
      expect(annotations[0].link[:url]).to include 'list=PLuW4g7xujBWfU26JUTW1DGs3hk4LD5KaL'
      expect(annotations[0].link[:type]).to be :playlist
      expect(annotations[0].link[:new_window]).to be true
    end
  end

  context 'given a video without cards and with a featured video' do
    let(:video_id) { 'PaOOnucHLA4' }

    it 'also returns the featured video' do
      expect(annotations.size).to be 1

      expect(annotations[0]).to be_a Yt::Annotations::Featured
      expect(annotations[0].starts_at).to be 0.0
      expect(annotations[0].ends_at).to be 3.0
      expect(annotations[0].text).to eq 'Check out this video: Me at the zoo'
      expect(annotations[0].link).to be_a Hash
      expect(annotations[0].link[:url]).to include 'v=jNQXAC9IVRw'
      expect(annotations[0].link[:type]).to be :video
      expect(annotations[0].link[:new_window]).to be true
    end
  end

  # NOTE: I'm using third-party videos for the following tests because I need
  # to have an authorized YouTube account to use associated links, and I don't.
  # If this test fails, make sure that the card is still there, or change the
  # video ids.
  context 'given a video an "associated website" link in a card' do
    let(:video_id) { '8tARnAXUGYA' }

    it 'also returns the featured video' do
      expect(annotations[1]).to be_a Yt::Annotations::Card
      expect(annotations[1].link[:type]).to be :website
    end
  end

  # NOTE: Third-party video, read above.
  context 'given a video an "associated website" link in a note' do
    let(:video_id) { '-W37TDK6dBM' }

    it 'also returns the featured video' do
      expect(annotations[5]).to be_a Yt::Annotations::Note
      expect(annotations[5].link[:type]).to be :website

      expect(annotations[6]).to be_a Yt::Annotations::Spotlight
      expect(annotations[6].link[:type]).to be :website
    end
  end

  # NOTE: Third-party video, read above.
  context 'given a video without annotations' do
    let(:video_id) { 'hx-gU_q1JCU' }

    it 'returns an empty array' do
      expect(annotations).to be_empty
    end
  end

  context 'given a video with an info card' do
    let(:video_id) { '_rfvhA5rrkM' }

    it 'does not raise an error' do
      expect(annotations).to be
    end
  end

  context 'given a video with a speech' do
    let(:video_id) { 'BgUkm4xdf74' }

    it 'does not raise an error' do
      expect(annotations).to be
    end
  end

  # NOTE: Third-party video, pause type annotation is no longer available.
  context 'given a video with a pause type annotation' do
    let(:video_id) { 'qLGxubfC1Ik' }

    it 'also returns pause annotation' do
      expect(annotations[1]).to be_a Yt::Annotations::Pause
    end
  end
end
