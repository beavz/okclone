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

  def current_essays
    [
      "essay1", "essay2", "essay3", "essay4",
      "essay5", "essay6", "essay7", "essay8"
    ]
  end

end
