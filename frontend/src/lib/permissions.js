const isUnauthorized  = (user) => user === null;

export const checkPermissions = (user, record, name_permission) => {
  if (isUnauthorized(user)) return false

  const rules = [
    {
      name: 'can_edit_comment',
      value: user.id ===  record.user.id || user.isAdmin
    },
    {
      name: 'can_edit_expired_comment',
      value: !record.isExpiredUpdate || user.isAdmin
    }
  ]

  const rule = rules.find(rule => rule.name === name_permission);

  return rule.value

}

export const hasPermission = (currentUser, permission) => {
  return currentUser.permissions.some((perm) => perm.name  === permission);
}