# frozen_string_literal: true
require 'helper'
require 'swr3_now_playing/mapper'

class MapperTest < MiniTest::Test
  def test_good
    result = SWR3::NowPlaying::SongMapper.map(File.new('test/fixtures/good.json'))
    refute_nil(result)
  end

  def test_title
    result = SWR3::NowPlaying::SongMapper.map(File.new('test/fixtures/good.json'))
    assert_equal('Breathing underwater', result.title)
  end

  def test_artist
    result = SWR3::NowPlaying::SongMapper.map(File.new('test/fixtures/good.json'))
    refute_nil(result)
    refute_nil(result.artist)
    artist = result.artist
    assert_equal('Sandé, Emeli', artist.name)
    assert_equal('http://www.swr3.de/musik/poplexikon/-/id=927882/did=1199388/cf24yn/index.html', artist.link)
  end

  def test_cover
    result = SWR3::NowPlaying::SongMapper.map(File.new('test/fixtures/good.json'))
    refute_nil(result)
    refute_nil(result.cover)

    cover = result.cover
    assert_equal('http://www.swr3.de/-/id=4244326/property=small/width=100/height=100/122v5mf/index.jpg', cover.small)
    assert_equal('http://www.swr3.de/-/id=4244326/property=thumbnail/width=160/height=160/bv9ur/index.jpg', cover.thumbnail)
    assert_equal('http://www.swr3.de/-/id=4244326/property=detail/width=200/height=200/f69z8d/index.jpg', cover.detail)
    assert_equal('http://www.swr3.de/-/id=4244326/property=zoom/width=500/height=500/1ugkxk9/index.jpg', cover.zoom)
  end

  def test_fixable
    result = SWR3::NowPlaying::SongMapper.map(File.new('test/fixtures/fixable.json'))
    refute_nil(result)
  end

  def test_unfixable
    assert_raises(JSON::ParserError) {
      SWR3::NowPlaying::SongMapper.map(File.new('test/fixtures/unfixable.json'))
    }
  end

  def test_play_date
    result = SWR3::NowPlaying::SongMapper.map(File.new('test/fixtures/good.json'))
    assert_equal(Time.at(1483110825), result.play_date)
  end

  def test_html_entities_title
    fixture = JSON.parse(File.new('test/fixtures/good.json').read)
    fixture['frontmod'].first['title'] = 'and nothin&#39; on'
    io = StringIO.new(JSON.dump(fixture))
    result = SWR3::NowPlaying::SongMapper.map(io)
    assert_equal("and nothin' on", result.title)
  end

  def test_html_entities_artist_name
    fixture = JSON.parse(File.new('test/fixtures/good.json').read)
    fixture['frontmod'].first['artist']['name'] = 'Rag&#39;n&#39;bone Man'
    io = StringIO.new(JSON.dump(fixture))
    result = SWR3::NowPlaying::SongMapper.map(io)
    assert_equal("Rag'n'bone Man", result.artist.name)
  end
end
