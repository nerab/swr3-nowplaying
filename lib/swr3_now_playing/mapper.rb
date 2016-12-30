# frozen_string_literal: true
require 'json'
require 'swr3_now_playing/song'

module SWR3
  module NowPlaying
    class Mapper
      class << self
        def map(json)
          j = JSON.parse(json.read)

          artist = j['frontmod'].first['artist']['name']
          title = j['frontmod'].first['title']

          Song.new(artist, title)
        end
      end
    end
  end
end
