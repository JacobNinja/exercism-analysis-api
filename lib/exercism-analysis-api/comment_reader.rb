class Exercism
  module AnalysisApi

    class CommentReader

      def self.read(path)
        Dir.chdir(path)
        Dir.glob('**/*.md').group_by(&File.method(:dirname)).each_with_object({}) do |(result, files), hsh|
          hsh[result.split('/').first] = files.each_with_object(Hash.new{|h, k| h[k] = Array.new}) do |file, hsh2|
            feedback_type = file.split('/')[1]
            hsh2[feedback_type] << File.read(file)
          end
        end
      end

    end

  end
end