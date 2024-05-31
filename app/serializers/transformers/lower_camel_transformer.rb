# frozen_string_literal: true

module Transformers
  class LowerCamelTransformer < Blueprinter::Transformer
    def transform(hash, _object, _options)
      hash.deep_transform_keys! { |key| key.to_s.camelize(:lower).to_sym }
    end
  end

  Blueprinter.configure do |config|
    config.default_transformers = [LowerCamelTransformer]
  end
end
