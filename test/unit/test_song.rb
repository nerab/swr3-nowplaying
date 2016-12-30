# -*- encoding: utf-8 -*-
# frozen_string_literal: true
require 'helper'

require 'swr3_now_playing/mapper'
require 'swr3_now_playing/loader'

class TestSong < NowPlayingTestCase
  include SWR3::NowPlaying

  def setup
    @song = mocked('setup') do
      Mapper.map(Loader.load)
    end
  end

  def test_song
    refute_nil(@song)
    assert_equal('Billy Talent', @song.artist)
    assert_equal('Red flag', @song.title)
    assert_equal('Billy Talent: Red flag', @song.to_s)
  end
end
