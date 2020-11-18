# frozen_string_literal: true

module EnotasApi
  class RawResult
    attr_reader :status_code, :content

    def initialize(status_code, content)
      @status_code = status_code
      @content = content
    end

    def success?
      status_code.between?(200, 299)
    end

    def error?
      !success?
    end
  end
end
