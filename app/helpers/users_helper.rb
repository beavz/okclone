module UsersHelper
  def basic_info(user)
    res = user.username
    if user.age
      res += " : #{user.age}"
    end
    if user.zip_code
      res+= " : #{user.zip_code}"
    end

    return res
  end

  def essays(user, can_edit)
    res = ""
    current_essays = [
      "essay1", "essay2", "essay3", "essay4",
      "essay5", "essay6", "essay7", "essay8"
    ]

    current_essays.each do |essay_key|
      if essay(user, essay_key, can_edit)
        res += essay(user, essay_key, can_edit)
      end
    end

    res.html_safe
  end


  private

  def essay(user, essay_key, can_edit)
    if can_edit
      return <<-HTML.html_safe
        <label>#{ t(essay_key) }</label>
        <br>
        <textarea name="user[#{ essay_key }]">
          #{ h(user.send(essay_key.to_sym)) }
        </textarea>
        <br>
      HTML

    else
      if user.send(essay_key.to_sym)
        return <<-HTML.html_safe
          <article id="#{ essay_key }">
            <h5>#{ t(essay_key) }</h5>
            <p> #{ h(user.send(essay_key.to_sym)) } </p>
          </article>
        HTML
      else
        return nil
      end
    end
  end


end
