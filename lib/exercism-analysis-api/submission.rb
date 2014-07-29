class Exercism
  module AnalysisApi

    class Submission

      def self.comment(key, user, body)
        submission = ::Submission.find_by(key: key)
        ::CreatesComment.create(submission.id, user, ::ConvertsMarkdownToHTML.convert(body)) if submission
      end

    end

  end
end
