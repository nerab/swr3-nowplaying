# -*- encoding: utf-8 -*-
require 'helper'

class TestSong < NowPlayingTestCase
  include SWR3::NowPlaying

  def setup
    @song = mocked('setup') do
      Song.load
    end
  end

  def test_song
    refute_nil(@song)
    assert_equal('Billy Talent', @song.artist)
    assert_equal('Red flag', @song.title)
  end
end
