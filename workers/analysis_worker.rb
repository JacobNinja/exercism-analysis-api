require 'sidekiq'

class AnalysisWorker
  include Sidekiq::Worker

  def perform(key)
    submission = config.submission.retrieve(key)
    with_config(submission.language) do |adapter, analyzers|
      results = Exercism::Analysis.new(adapter.new(submission.code)).run(*analyzers)
      comment = Exercism::AnalysisApi::AnalysisFormatter.new(config.comments_table).format(results.values.flatten)
      config.submission.comment(key, comment.join("\n"))
    end
  end

  private

  def with_config(language)
    analyzer_config = config.analyzers[language]
    yield analyzer_config.adapter, analyzer_config.analyzers if analyzer_config
  end

  def config
    Exercism::AnalysisApi.config
  end

end