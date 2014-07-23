require 'exercism-analysis'

require File.expand_path('../exercism-analysis-api/analysis_formatter', __FILE__)
require File.expand_path('../exercism-analysis-api/comment_table', __FILE__)

require File.expand_path('../exercism-analysis-api/submission', __FILE__)
require File.expand_path('../exercism-analysis-api/config', __FILE__)

class Exercism

  module AnalysisApi

    def self.config
      @@config ||= Config.from_yaml(config_path, comments_path)
    end

    private

    def self.config_path
      File.expand_path('../../config/exercism-analysis-api.yml', __FILE__)
    end

    def self.comments_path
      File.expand_path('../../config/comments.yml', __FILE__)
    end

  end

end