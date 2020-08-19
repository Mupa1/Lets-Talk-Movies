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

  def user_pic(user)
    if user[:Photo].nil?
      gravatar_for user, size: 50
    else
      image_tag user.Photo.thumb.url
    end
  end

  def follow_unfollow(user)
    return if current_user.id == user.id

    if current_user.followed.any? { |person| person.FollowedId == user.id }
      render partial: 'users/unfollow_button', locals: { user: user }
    else
      render partial: 'users/follow_button', locals: { user: user }
    end
  end

  def like_unlike(opinion)
    if opinion.likes.any? { |like| like.UserId == current_user.id }
      link_to opinion_like_path(opinion, opinion.likes.ids), method: :delete, remote: true, class: 'user-1' do
        render partial: 'shared/unlikes', locals: { opinion: opinion }
      end
    else
      link_to opinion_likes_path(opinion), method: :post, remote: true, class: 'user-2' do
        render partial: 'shared/likes', locals: { opinion: opinion }
      end
    end
  end
end
