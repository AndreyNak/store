# frozen_string_literal: true

class BaseBlueprint < Blueprinter::Base
  transform Transformers::LowerCamelTransformer
end
