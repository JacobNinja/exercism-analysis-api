require File.expand_path('../test_helper', __FILE__)

class AnalysisFormatterTest < Test::Unit::TestCase

  attr_reader :sut
  def setup
    comment_formatter = CommentTable.new({'result_type' => {'feedback_type' => ['foo'], 'multiple' => ['bar', 'baz']}})
    @sut = AnalysisFormatter.new(comment_formatter)
  end

  def test_returns_comment_for_each_feedback
    feedback = Exercism::Analyzers::Analyzer::Feedback.new(:feedback_type)
    result = Exercism::Analyzers::Analyzer::Result.new(:result_type, [feedback])
    assert_equal ['foo'], sut.format([result])
  end

  def test_returns_random_comment_for_feedback_with_multiple_values
    feedback = Exercism::Analyzers::Analyzer::Feedback.new(:multiple)
    result = Exercism::Analyzers::Analyzer::Result.new(:result_type, [feedback])
    formatted_result = sut.format([result])
    assert_equal 1, formatted_result.count
    assert_includes ['bar', 'baz'], formatted_result.first
  end

  def test_skips_feedback_if_no_comment_entry
    feedback = Exercism::Analyzers::Analyzer::Feedback.new(:no_match)
    result = Exercism::Analyzers::Analyzer::Result.new(:result_type, [feedback])
    assert_empty sut.format([result])
  end

end