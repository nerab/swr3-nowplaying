# frozen_string_literal: true

module SWR3
  module NowPlaying
    class Artist
      attr_reader :name, :link
      alias_method :to_s, :name

      def initialize(name, link)
        @name = name
        @link = link
      end
    end
  end
end
