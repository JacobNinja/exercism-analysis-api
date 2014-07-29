require 'exercism-analysis'

require File.expand_path('../exercism-analysis-api/analysis_formatter', __FILE__)
require File.expand_path('../exercism-analysis-api/comment_reader', __FILE__)
require File.expand_path('../exercism-analysis-api/comment_table', __FILE__)

require File.expand_path('../exercism-analysis-api/submission', __FILE__)
require File.expand_path('../exercism-analysis-api/config', __FILE__)

class Exercism

  module AnalysisApi

    def self.config
      @@config ||= Config.from_files(config_path, comments_dir)
    end

    private

    def self.config_path
      File.expand_path('../../config/exercism-analysis-api.yml', __FILE__)
    end

    def self.comments_dir
      File.expand_path('../../comments', __FILE__)
    end

  end

end