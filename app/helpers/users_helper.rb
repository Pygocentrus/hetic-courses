module UsersHelper
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

  def color_avatar(user)
    if user.role == "Admin"
      "#17C0E4"
    elsif user.role == "Modérateur"
      "#E4172D"
    else
      "#69FF00"
    end
  end
end
