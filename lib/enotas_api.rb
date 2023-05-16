# frozen_string_literal: true

Dir[File.join(__dir__, 'enotas_api/**/*.rb')].each(&method(:require))

module EnotasApi
end
