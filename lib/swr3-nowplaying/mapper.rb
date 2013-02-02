module SWR3
  module NowPlaying
    class Mapper
      class << self
        def map(json)
          j = JSON.load(json)
          artist = j['frontmod'].first['artist']['name']
          title = j['frontmod'].first['title']
          Song.new(artist, title)
        end
      end
    end
  end
end
