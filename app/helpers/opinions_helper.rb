module OpinionsHelper
  def opinion_like_count(opinion)
    return unless opinion.likes.any?

    pluralize(opinion.likes.size, 'like').to_s
  end

  def edit_opinion_button(opinion)
    link_to '', edit_opinion_path(opinion), class: 'fa fa-pencil mx-2'
  end

  def delete_opinion_button(opinion)
    # rubocop: disable Layout/LineLength
    link_to '', opinion_path(opinion), method: :delete, data: { confirm: 'Are you sure you want to delete the review?' }, class: 'fa fa-trash mx-2'
    # rubocop: enable Layout/LineLength
  end
end
