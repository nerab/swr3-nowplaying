# frozen_string_literal: true
require 'helper'

require 'swr3_now_playing/mapper'

class MapperTest < MiniTest::Test
  def test_good
    result = SWR3::NowPlaying::Mapper.map(File.new('test/fixtures/good.json'))
    refute_nil(result)
  end

  def test_bad
    assert_raises do
      SWR3::NowPlaying::Mapper.map('test/fixtures/broken.json')
    end
  end
end
