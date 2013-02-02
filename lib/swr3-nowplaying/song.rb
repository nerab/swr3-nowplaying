module SWR3
  module NowPlaying
    class Song
      class << self
        def load
          j = JSON.load(open('http://www.swr3.de/export/json/-/id=202234/gp1=1/wi3aps/index.json'))
          artist = j['frontmod'].first['artist']['name']
          title = j['frontmod'].first['title']
          Song.new(artist, title)
        end
      end

      attr_reader :artist, :title

      def initialize(artist, title)
        @artist, @title = artist, title
      end
    end
  end
end
