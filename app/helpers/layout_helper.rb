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

  def to_slug(str)
    ret = str.strip.downcase
    ret.gsub! /['`]/,""
    ret.gsub! /\s*@\s*/, " at "
    ret.gsub! /\s*&\s*/, " and "
    ret.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, '-'
    ret.gsub! /_+/,"_"
    ret.gsub! /\-+/,"-"
    ret.gsub! /\A[_\-\.]+|[_\-\.]+\z/,""
    ret
  end

  def to_slug2(str)
    str.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end


end
