class AnalysisFormatter

  def initialize(comment_formatter)
    @comment_formatter = comment_formatter
  end

  def format(results)
    results.flat_map do |result|
      result.feedback.map do |feedback|
        @comment_formatter.lookup(result.type, feedback.type).sample
      end.compact
    end
  end

end