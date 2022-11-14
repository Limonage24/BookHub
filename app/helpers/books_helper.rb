module BooksHelper
  def comment_tree(root)
    html = ''
    if root
      html = "<div class=\"comment-body\">#{root[0].id}</div>" if root[0].is_a?(Comment)
      unless root[1].nil?
        html << '<div class="comment-children">'
        root[1].each do |comment_child|
          html << comment_tree(comment_child)
        end
        html << '</div>'
      end
    end
    html
  end

  def safe_comment_tree(root)
    comment_tree(root).html_safe
  end
end
