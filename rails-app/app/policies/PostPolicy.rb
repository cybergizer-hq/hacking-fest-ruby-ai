class PostPolicy < ApplicationPolicy
  def manage?
    user.admin?
  end
end