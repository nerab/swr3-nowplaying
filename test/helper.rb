require 'minitest/autorun'
require 'swr3-nowplaying'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'test/fixtures/vcr'
  c.hook_into :webmock
end

module SWR3
  module NowPlaying
    class TestCase < MiniTest::Unit::TestCase
      def mocked(cassette, &block)
        VCR.use_cassette("#{self.class.name}_#{cassette}", :record => :new_episodes){block.call}
      end
    end
  end
end
