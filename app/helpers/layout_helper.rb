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

  def is_user_avatar_empty?(user)
    user.avatar.empty?
  end

end
