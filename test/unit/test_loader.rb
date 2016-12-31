# frozen_string_literal: true
require 'helper'

require 'swr3_now_playing/loader'

class LoaderTest < MiniTest::Test
  def test_good
    stream = SWR3::NowPlaying::Loader.load('test/fixtures/good.json')
    refute_nil(stream)
    refute_empty(stream.read)
  end
end
