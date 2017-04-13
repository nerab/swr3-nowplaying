# frozen_string_literal: true

require 'helper'

require 'swr3_now_playing/mapper'
require 'swr3_now_playing/loader'

class SystemTest < MiniTest::Test
  include SWR3::NowPlaying

  def setup
    @song = SongMapper.map(Loader.load)
    refute_nil(@song)
  end

  def test_song
    refute_empty(@song.to_s)
  end

  def test_song_title
    refute_empty(@song.title)
  end

  def test_artist
    refute_nil(@song.artist)
    refute_empty(@song.artist.name)
  end
end
