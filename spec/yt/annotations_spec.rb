require 'spec_helper'

describe Yt::Annotations do
  let(:annotations) { Yt::Annotations.for video_id }

  context 'given a video with cards' do
    let(:video_id) { 'MsZtGuBU3vA' }

    it 'returns all the annotations and cards' do
      expect(annotations.size).to be 6

      expect(annotations[0]).to be_a Yt::Annotations::Card
      expect(annotations[0].starts_at).to be 1.115
      expect(annotations[0].ends_at).to be 8.115
      expect(annotations[0].text).to include "EXCLUSIVE: 'Finding Dory' Trailer"
      expect(annotations[0].link).to be_a Hash
      expect(annotations[0].link[:url]).to include 'v=3JNLwlcPBPI'
      expect(annotations[0].link[:type]).to be :video
      expect(annotations[0].link[:new_window]).to be true

      expect(annotations[1]).to be_a Yt::Annotations::Card
      expect(annotations[1].starts_at).to be 8.038
      expect(annotations[1].ends_at).to be 15.038
      expect(annotations[1].text).to include 'Adorable Kids'
      expect(annotations[1].link).to be_a Hash
      expect(annotations[1].link[:url]).to include 'list=PLuW4g7xujBWfU26JUTW1DGs3hk4LD5KaL'
      expect(annotations[1].link[:type]).to be :playlist
      expect(annotations[1].link[:new_window]).to be true

      expect(annotations[2]).to be_a Yt::Annotations::Card
      expect(annotations[2].starts_at).to be 15.038
      expect(annotations[2].ends_at).to be 22.038
      expect(annotations[2].text).to eq 'Card with link to channel'
      expect(annotations[2].link).to be_a Hash
      expect(annotations[2].link[:url]).to include 'youtube.com/user/TheEllenShow'
      expect(annotations[2].link[:type]).to be :channel
      expect(annotations[2].link[:new_window]).to be true

      expect(annotations[3]).to be_a Yt::Annotations::Card
      expect(annotations[3].starts_at).to be 22.192
      expect(annotations[3].ends_at).to be 29.192
      expect(annotations[3].text).to eq 'Cards link to Merch site'
      expect(annotations[3].link).to be_a Hash
      expect(annotations[3].link[:url]).to include 'bandcamp.com'
      expect(annotations[3].link[:type]).to be :website
      expect(annotations[3].link[:new_window]).to be true

      expect(annotations[4]).to be_a Yt::Annotations::Branding
      expect(annotations[4].starts_at).to be 30.0
      expect(annotations[4].ends_at).to be 37.0
      expect(annotations[4].text).to be_empty
      expect(annotations[4].link).to be_a Hash
      expect(annotations[4].link[:url]).to include 'youtube.com/channel/UCwCnUcLcb9-eSrHa_RQGkQQ'
      expect(annotations[4].link[:type]).to be :channel
      expect(annotations[4].link[:new_window]).to be true

      expect(annotations[5]).to be_a Yt::Annotations::Card
      expect(annotations[5].starts_at).to be 30.038
      expect(annotations[5].ends_at).to be 37.038
      expect(annotations[5].text).to eq 'Card links to Crowdfunding'
      expect(annotations[5].link).to be_a Hash
      expect(annotations[5].link[:url]).to include 'causes.com'
      expect(annotations[5].link[:type]).to be :website
      expect(annotations[5].link[:new_window]).to be true
    end
  end

  context 'given a video with an end screen' do
    let(:video_id) { 'NNUlOLaupuw' }

    it 'returns all the end screen annotations' do
      expect(annotations.size).to be 4

      expect(annotations[0]).to be_a Yt::Annotations::EndScreen
      expect(annotations[0].starts_at).to be 25.312
      expect(annotations[0].ends_at).to be 35.005
      expect(annotations[0].text).to eq 'PewDiePie'
      expect(annotations[0].link).to be_a Hash
      expect(annotations[0].link[:url]).to eq 'https://www.youtube.com/channel/UC-lHJZR3Gqxm24_Vd_AJ5Yw'
      expect(annotations[0].link[:type]).to be :channel
      expect(annotations[0].link[:new_window]).to be true

      expect(annotations[1]).to be_a Yt::Annotations::EndScreen
      expect(annotations[1].starts_at).to be 25.962
      expect(annotations[1].ends_at).to be 35.005
      expect(annotations[1].text).to eq 'T-Shirt Shop for Geeks, Gamer, Nerds'
      expect(annotations[1].link).to be_a Hash
      redirect_to_link = URI.decode_www_form(annotations[1].link[:url]).to_h["q"]
      expect(redirect_to_link).to eq 'https://3dsupply.de/en/'
      expect(annotations[1].link[:type]).to be :website
      expect(annotations[1].link[:new_window]).to be true

      expect(annotations[2]).to be_a Yt::Annotations::EndScreen
      expect(annotations[2].starts_at).to be 26.741
      expect(annotations[2].ends_at).to be 35.015
      expect(annotations[2].text).to eq 'PSY - GANGNAM STYLE(강남스타일) M/V'
      expect(annotations[2].link).to be_a Hash
      expect(annotations[2].link[:url]).to eq 'https://www.youtube.com/watch?v=9bZkp7q19f0'
      expect(annotations[2].link[:type]).to be :video
      expect(annotations[2].link[:new_window]).to be false

      expect(annotations[3]).to be_a Yt::Annotations::EndScreen
      expect(annotations[3].starts_at).to be 27.287
      expect(annotations[3].ends_at).to be 35.031
      expect(annotations[3].text).to eq 'First public playlist'
      expect(annotations[3].link).to be_a Hash
      expect(annotations[3].link[:url]).to include 'list=PL-LeTutc9GRKD3yBDhnRF_yE8UTaQI5Jf'
      expect(annotations[3].link[:type]).to be :playlist
      expect(annotations[3].link[:new_window]).to be false
    end
  end

  context 'given another video with end screen' do
    let(:video_id) { 'EuqmXkjhisE' }

    it 'returns an end screen annotation with subscribe type' do
      expect(annotations[2]).to be_a Yt::Annotations::EndScreen
      expect(annotations[2].link[:type]).to be :subscribe
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
end
