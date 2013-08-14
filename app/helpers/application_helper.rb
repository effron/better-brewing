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
  
  def current_users_recipe?(recipe)
    current_user && current_user.id == recipe.user.id
  end
  
  def clean_date(object)
    object.created_at.to_datetime.strftime('%d-%m-%y %l:%M')
  end

end
