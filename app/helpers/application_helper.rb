module ApplicationHelper
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5.hexdigest(user.Username.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.Username, class: 'gravatar')
  end

  def current_user
    session[:current_user] ? User.find(session[:current_user]) : nil
  end

  def profile_pic
    if current_user[:Photo].nil?
      gravatar_for current_user, size: 50
    else
      image_tag current_user.Photo.thumb.url
    end
  end

  def cover_image
    if @user[:CoverImage].nil?
      image_tag 'https://via.placeholder.com/700x300?text=No+Cover'
    else
      image_tag @user.CoverImage.standard.url
    end
  end
end
