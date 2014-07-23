require File.expand_path('../test_helper', __FILE__)

class CommentFormatterTest < Test::Unit::TestCase

  attr_reader :sut
  def setup
    @sut = Exercism::AnalysisApi::CommentTable.new({'result_type' => {'feedback_type' => ['comment']}})
  end

  def test_returns_matching_entries
    assert_equal ['comment'], sut.lookup(:result_type, :feedback_type)
  end

  def test_empty_for_missing_feedback_type
    assert_equal [], sut.lookup(:result_type, :foo)
  end

  def test_empty_for_missing_result_type
    assert_equal [], sut.lookup(:foo, :feedback_type)
  end

end