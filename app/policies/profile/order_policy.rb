module Profile
  class OrderPolicy < ApplicationPolicy
    def update
      record.received?
    end

    def reject?
      record.received? && !record.expired?
    end

    def cancel?
      record.pending? || record.delivering?
    end
  end
end
