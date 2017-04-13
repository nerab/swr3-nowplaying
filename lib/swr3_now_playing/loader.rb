# frozen_string_literal: true

require 'open-uri'

module SWR3
  module NowPlaying
    class Loader
      class << self
        def load(url='https://www.swr3.de/export/json/-/id=202234/gp1=1/wi3aps/index.json')
          open(url)
        end
      end
    end
  end
end
