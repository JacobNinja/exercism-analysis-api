class Exercism
  module AnalysisApi

    class Config

      AnalyzerConfig = Struct.new(:adapter, :analyzers)

      def self.from_yaml(config_file, comments_file)
        config = YAML.load(File.read(config_file))
        comments = YAML.load(File.read(comments_file))
        new(config['submission_url'], comments)
      end

      def initialize(submission_url, comments)
        @submission_url = submission_url
        @comments = comments
      end

      def submission
        @submission ||= Submission.new(@submission_url)
      end

      def comments_table
        @comments_table ||= CommentTable.new(@comments)
      end

      def analyzers
        {'ruby' => AnalyzerConfig.new(Exercism::Adapters::Ruby, [Exercism::Analyzers::ControlFlow,
                                                                 Exercism::Analyzers::Indentation,
                                                                 Exercism::Analyzers::ForLoop,])}
      end

    end

  end

end