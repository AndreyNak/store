class DeniedPermission < ApplicationRecord
  belongs_to :user
  belongs_to :permission

  validates :user_id, presence: true
  validates :permission_id, presence: true

  validates :permission_id, uniqueness: { scope: :user_id }
end
