# frozen_string_literal: true

require 'json'
require 'cgi'
require 'swr3_now_playing/song'
require 'swr3_now_playing/artist'
require 'swr3_now_playing/cover'

module SWR3
  module NowPlaying
    class ArtistMapper
      class << self
        def map(json)
          Artist.new(CGI.unescapeHTML(json['name']), json['link'])
        end
      end
    end

    class CoverMapper
      class << self
        def map(json)
          Cover.new.tap do |cover|
            %w[small thumbnail detail zoom].each do |size|
              cover[size] = json[size]['src']
            end
          end
        end
      end
    end

    class MissingNullFixer
      def fix(stream)
        stream.gsub(/{ "detail": ,/, '{ "detail": {},')
      end
    end

    class SongMapper
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

          artist = ArtistMapper.map(j['frontmod'].first['artist'])
          title = CGI.unescapeHTML(j['frontmod'].first['title'])
          cover = CoverMapper.map(j['frontmod'].first['cover'])

          Song.new(artist, title, cover).tap do |song|
            time_stamp = j['frontmod'].first['playDate']

            if time_stamp
              song.play_date = Time.at(time_stamp / 1000)
            end
          end
        end
      end
    end
  end
end
