require 'test_helper'
require 'rails/performance_test_help'

class NoCacheTestTest < ActionDispatch::PerformanceTest
  self.profile_options = { runs: 4, metrics: [:wall_time, :memory], output: 'tmp/performance', formats: [:flat] }

  test "no_cache_test" do
    get '/books/no_cache_index'
  end
end
