# frozen_string_literal: true

module UserPermissionMethods
  def method_missing(method_name, *arguments, &)
    if permission_method?(method_name)
      permission_name = method_name.to_s.chomp('?')
      access?(permission_name)
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

  def access?(name)
    permission?(name)
  end

  def permission?(name)
    permissions.exists?(name:)
  end
end
