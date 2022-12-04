module BooksHelper
  def comment_tree(root)
    html = (render root[0]).to_s.delete_suffix('</div>')
    unless root[1].nil?
      html << '<div class="comment-children">'
      root[1].each do |comment_child|
        html << comment_tree(comment_child)
      end
      html << '</div>'
    end
    html << '</div>'
  end

  def safe_comment_tree(root)
    comment_tree(root).html_safe
  end
end
