# frozen_string_literal: true

Dir[File.join(__dir__, 'enotas_api/**/*.rb')].sort.each(&method(:require))

module EnotasApi
  class Error < StandardError; end
  # Your code goes here...
end
