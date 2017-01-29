# frozen_string_literal: true
module SWR3
  module NowPlaying
    class Song
      attr_reader :artist, :title, :cover
      attr_accessor :play_date

      def initialize(artist, title, cover=nil)
        @artist = artist
        @title = title
        @cover = cover
      end

      def to_s
        "#{artist.name}: #{title}"
      end
    end
  end
end
