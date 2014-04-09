module PostsHelper
  def render_subcomments comment
    out = ""
    out += "<li data-id=#{comment.id}>"
      out += "#{comment.author}: #{comment.comment}"
      out += button_tag "Answer", class: 'answer-to-comment', data:{id:comment.id}
      out += "<ul class=\"nested-comment\">"
      comment.children.each do |child|
        out += render_subcomments child
      end
      out += "</ul>"
    out += "</li>"
  end
end
