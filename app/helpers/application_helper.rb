module ApplicationHelper

  def avatar_url(user)
    default_url = "#{root_url}#{asset_path "default.png"}"
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?d=#{CGI.escape(default_url)}"
  end

  def round_or_nil(number, decimals = 0)
    if number.nil?
      nil
    else
      number.round(decimals)
    end
  end

end
