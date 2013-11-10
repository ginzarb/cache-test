require 'test_helper'
require 'rails/performance_test_help'

class CacheTestTest < ActionDispatch::PerformanceTest
  self.profile_options = { runs: 4, metrics: [:wall_time, :memory], output: 'tmp/performance', formats: [:flat] }

  test "cache_test" do
    get '/books/cache_index'
  end
end
