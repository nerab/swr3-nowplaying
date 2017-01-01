# frozen_string_literal: true
require 'json'
require 'swr3_now_playing/song'

module SWR3
  module NowPlaying
    class MissingNullFixer
      def fix(stream)
        stream.gsub(/{ "detail": ,/, '{ "detail": {},')
      end
    end

    class Mapper
      class << self
        def map(json)
          fixers = [MissingNullFixer.new]
          stream = json.read

          begin
            j = JSON.parse(stream)
          rescue JSON::ParserError
            if fixers.empty?
              raise
            else
              stream = fixers.pop.fix(stream)
              retry
            end
          end

          artist = j['frontmod'].first['artist']['name']
          title = j['frontmod'].first['title']

          Song.new(artist, title)
        end
      end
    end
  end
end
