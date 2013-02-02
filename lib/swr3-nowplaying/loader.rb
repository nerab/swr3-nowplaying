module SWR3
  module NowPlaying
    class Loader
      class << self
        def load(url = 'http://www.swr3.de/export/json/-/id=202234/gp1=1/wi3aps/index.json')
          open(url)
        end
      end
    end
  end
end
