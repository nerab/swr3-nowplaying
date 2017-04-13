# frozen_string_literal: true

require 'helper'
require 'swr3_now_playing/song'

class SongTest < MiniTest::Test
  def test_to_s
    artist = Minitest::Mock.new
    artist.expect(:name, 'foo')

    result = SWR3::NowPlaying::Song.new(artist, 'bar')
    refute_nil(result)
    assert_equal('foo: bar', result.to_s)
  end
end
