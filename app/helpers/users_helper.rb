module UsersHelper
  def is_admin?
    current_user.present? ? current_user.role == "Admin" : false
  end

  def is_own_account(user)
    current_user.id == user.id
  end

  def is_user_admin?(user)
    user.role == "Admin"
  end

  def is_superior_of?(user)
    if !user.id.nil?
      roles = ["Admin", "Modérateur", "Utilisateur"]
      roles.index(current_user.role) < roles.index(user.role)
    else
      false
    end
  end

  def max_roles_assignable
    if is_admin? && !is_user_admin?(@user)
      ["Admin", "Modérateur", "Utilisateur"]
    elsif current_user.role == "Modérateur" && @user.role == "Utilisateur"
      ["Modérateur", "Utilisateur"]
    else
      @user.role
    end
  end
end
