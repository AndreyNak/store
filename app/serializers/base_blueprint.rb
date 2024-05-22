class BaseBlueprint < Blueprinter::Base
  transform Transformers::LowerCamelTransformer
end
