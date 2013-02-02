module SWR3
  module NowPlaying
    class Song
      attr_reader :artist, :title

      def initialize(artist, title)
        @artist, @title = artist, title
      end

      def to_s
        "#{@artist}: #{@title}"
      end
    end
  end
end
