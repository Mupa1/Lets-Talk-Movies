module OpinionsHelper
  def opinion_like_count(opinion)
    return unless opinion.likes.any?

    pluralize(opinion.likes.size, 'like').to_s
  end
end
