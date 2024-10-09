class UserPolicy < ApplicationPolicy

  def create?
    @user.admin?
  end

  def assign_user_policy?
    @user.admin?
  end

  def upload_document?
    @user.user?
  end

  def show?
    @user.user?
  end

  def upload_policy_document?
    @user.user?
  end
 
end
