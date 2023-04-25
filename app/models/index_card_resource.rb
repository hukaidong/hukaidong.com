# frozen_string_literal: true
require 'yaml'

class IndexCardResource
  class << self
    def load_all
      filename_glob = Rails.root.join('lib', 'assets', 'IndexCards', '*.yml')

      filenames = Dir[filename_glob]
      filenames.delete_if { |x| /cli/ =~ x } # Not able to format these yet
      filenames.flat_map do |filename|
        load_from_file(Rails.root.join('lib', 'assets', 'IndexCards', filename))
      end
    end

    def load_from_file(file)
      data = YAML.safe_load(File.read(file))
      namespace = data.delete('namespace')
      data.map do |card|
        IndexCard.new(card, namespace)
      end
    end
  end
end

