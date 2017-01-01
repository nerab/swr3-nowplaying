# frozen_string_literal: true
require 'helper'

require 'swr3_now_playing/mapper'

class MapperTest < MiniTest::Test
  def test_good
    result = SWR3::NowPlaying::Mapper.map(File.new('test/fixtures/good.json'))
    refute_nil(result)
  end

  def test_fixable
    result = SWR3::NowPlaying::Mapper.map(File.new('test/fixtures/fixable.json'))
    refute_nil(result)
  end

  def test_unfixable
    assert_raises(JSON::ParserError) {
      SWR3::NowPlaying::Mapper.map(File.new('test/fixtures/unfixable.json'))
    }
  end
end
