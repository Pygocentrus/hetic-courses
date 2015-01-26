module User::Identifiable

  def is?(role)
    current_user.nil? ? false : current_user.role == role
  end

  def is_own_account?(user)
    current_user.nil? ? false : current_user.id == user.id
  end

  def is_admin?
    current_user.nil? ? false : current_user.role == "Admin"
  end

  def moderator?
    current_user.nil? ? false : current_user.role == "Modérateur"
  end

  def is_superior_of?(user)
    if !user.nil?
      roles = ["Admin", "Modérateur", "Utilisateur"]
      roles.index(current_user.role) < roles.index(user.role)
    else
      false
    end
  end

end
