# frozen_string_literal: true

module PermissionMethods
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def method_missing(method_name, *arguments, &)
      if permission_method?(method_name)
        permission_name = method_name.to_s.chomp('?')
        permission?(permission_name)
      else
        super
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      permission_method?(method_name) || super
    end

    private

    def permission_method?(method_name)
      method_name.to_s.start_with?('can_') && method_name.to_s.end_with?('?')
    end

    def permission?(permission_name)
      exists?(name: permission_name)
    end
  end
end
