# frozen_string_literal: true
require 'minitest/autorun'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'test/fixtures/vcr'
  c.hook_into :webmock
end

class NowPlayingTestCase < MiniTest::Test
  def mocked(cassette, &block)
    VCR.use_cassette("#{self.class.name}_#{cassette}", record: :new_episodes) { yield }
  end
end
