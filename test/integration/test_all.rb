# -*- encoding: utf-8 -*-
# frozen_string_literal: true
require 'helper'

require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'test/fixtures/vcr'
  c.hook_into :webmock
end

def mocked(cassette, &block)
  VCR.use_cassette("#{self.class.name}_#{cassette}", record: :new_episodes) { yield }
end

require 'swr3_now_playing/mapper'
require 'swr3_now_playing/loader'

class IntegrationTest < MiniTest::Test
  include SWR3::NowPlaying

  def setup
    @song = mocked('setup') do
      SongMapper.map(Loader.load)
    end
  end

  def test_song_title
    refute_nil(@song)
    assert_equal('Red flag', @song.title)
    assert_equal('Billy Talent: Red flag', @song.to_s)
  end

  def test_artist
    refute_nil(@song)
    assert_equal('Billy Talent', @song.artist.name)
  end
end
