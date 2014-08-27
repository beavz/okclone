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

  def essays(user)
    res = ""
    current_essays = [
      "essay1", "essay2", "essay3", "essay4",
      "essay5", "essay6", "essay7", "essay8"
    ]

    current_essays.each do |essay_key|
      if essay(user, essay_key)
        res += essay(user, essay_key)
      end
    end

    res.html_safe
  end

  def questions(responses)
    res = ""
    responses.each do |response|
      res += q_and_a(response)
    end

    res.html_safe
  end

  private

  def essay(user, essay_key)
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

  def q_and_a(response)
    return <<-HTML.html_safe
      <article>
        <h5>#{ response.question.text }</h5>
        <p> #{ response.answer.text } </p>
        <p> #{ h(response.explanation) } </p>
      </article>
    HTML
  end
end
