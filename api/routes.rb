require 'bundler'
Bundler.require

require File.expand_path('../../lib/exercism-analysis-api', __FILE__)

require File.expand_path('../../workers/analysis_worker', __FILE__)

post '/analyze/:key' do |key|
  AnalysisWorker.perform_async(key)
  200
end