class TopicBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :people_count
  association :tags, blueprint: TagBlueprint
end