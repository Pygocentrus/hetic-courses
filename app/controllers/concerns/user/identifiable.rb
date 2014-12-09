module User::Identifiable

  def is?(role)
    current_user.role == role
  end

  def is_own_account?(user)
    current_user.id == user.id
  end

  def is_admin?
    current_user.role == "Admin"
  end

  def moderator?
    if !current_user.nil?
      current_user.role == "Modérateur"
    else
      false
    end
  end

  def is_superior_of?(user)
    roles = ["Admin", "Modérateur", "Utilisateur"]
    roles.index(current_user.role) < roles.index(user.role)
  end

end
