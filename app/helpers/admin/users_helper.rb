module Admin::UsersHelper
  def conver_role role
    role == false ? 0 : 1
  end
end
