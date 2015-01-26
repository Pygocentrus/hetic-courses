module LayoutHelper

  require 'digest/md5'

  def email_hash_for(email)
    Digest::MD5.hexdigest(email)
  end

  def full_url_for(options)
    size = options[:size].present? ? ("?s=" + options[:size].to_s) : ""
    default = "&d=retro"
    "http://www.gravatar.com/avatar/#{email_hash_for(options[:email])}" + size + default
  end

  def is_user_avatar_empty?
    current_user.avatar.nil? ? true : current_user.avatar.empty?
  end

  def is_admin?
    current_user.nil? ? false : current_user.role == "Admin"
  end

  def is_moderator?
    current_user.nil? ? false : current_user.role == "Modérateur" || current_user.role == "Admin"
  end

  def is_connected?
    current_user.present?
  end

end
