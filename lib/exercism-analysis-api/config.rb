class Exercism
  module AnalysisApi

    class Config

      AnalyzerConfig = Struct.new(:adapter, :analyzers)

      def self.from_files(config_file, comments_path)
        config = YAML.load(File.read(config_file))
        comments = CommentReader.read(comments_path)
        new(config['user_key'], comments)
      end

      attr_reader :user_key

      def initialize(user_key, comments)
        @user_key = user_key
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