const isUnauthorized  = (user) => user === null;

export const checkPermissions = (user, record, name_permission) => {
  if (isUnauthorized(user)) return false

  const rules = [
    {
      name: 'can_edit_comment',
      value: user.id === record.user?.id
    },
    {
      name: 'can_edit_expired_comment',
      value: !record.isExpiredUpdate
    },
    {
      name: 'can_edit_admin_user_cancel_restriction',
      value: hasPermission(user, name_permission) && (record.officer.id == user.id || hasPermission(user, 'can_edit_admin_user_cancel_restriction_stranger'))
    }
  ]

  const rule = rules.find(rule => rule.name === name_permission);

  return rule.value

}

export const hasPermission = (user, permission) => {
  return user.permissions.some((perm) => perm.name  === permission);
}