require 'net/http'
require 'json'
require 'uri'

class Exercism
  module AnalysisApi

    class Submission

      Value = Struct.new(:language, :code)

      def initialize(url)
        @url = url
      end

      def retrieve(key)
        response = get_json("/submissions/#{key}")
        Value.new(response['language'], response['code'])
      end

      def comment(key, text)
        post("/submissions/#{key}/comment", text)
      end

      private

      def get_json(path)
        JSON.parse(Net::HTTP.get(make_uri(path)))
      end

      def post(path, body)
        Net::HTTP.post_form(make_uri(path), comment: body)
      end

      def make_uri(path)
        URI([@url, path].join)
      end

    end

  end
end
