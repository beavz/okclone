class User < ActiveRecord::Base
  validates :session_token, :password_digest, presence: true
  validates :username, :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  enum(
    gender: [ :man, :woman, :other_gender ],
    orientation: [ :gay, :straight, :bi , :ace ],
    ethnicity: [ :white, :black, :purple, :latino_a, :asian, :other, :mix ],
    body_type: [ :fat, :thin, :athletic, :avg, :really_fat ],
    diet: [ :strictly_insects, :vegitarian, :vegan, :paleo, :kosher, :omnivore ],
    smokes: [ :like_a_chimney, :occasionally, :rarely_smokes, :never_smokes ],
    drinks: [ :daily, :frequently, :socially, :rarely, :never],
    drugs: [ :yes, :absolutely_not, :previously, :yes_but_only_pot ],
    religion: [ :no_thanks, :atheist, :christian, :muslim, :jewish, :buddhist, :hindu, :other_religion],
    sign: [ :aries, :taurus, :gemini, :cancer, :leo, :virgo, :libra, :scorpio, :sagittarius, :capricorn, :aquarius, :pisces],
    education: [ :no_school, :grade_school, :some_high_school, :high_school, :associates_degree, :bachelors_degree, :some_post_graduate_work, :masters_degree, :doctorate],
    job: [ :science, :something_else],
    income: [ :some_money, :no_money],
    relationship_status: [ :single, :available, :not_available],
    relationship_type: [ :strictly_monogamous, :mostly_monogamous, :strictly_non_monogamous, :mostly_non_monogamous],
    offspring: [ :none_do_not_want_kids, :none_want_kids, :have_kids],
    pets: [ :none_do_not_want, :none_want, :have_cat, :have_dog, :have_various],
    looking_for_status: [ :only_single, :all_available, :any ]
  )

  after_initialize :ensure_session_token

  has_many :responses
  has_many :acceptable_responses
  has_many(
    :answered_questions,
    through: :responses,
    source: :question
  )

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username);
    if user && user.has_password?(password)
      return user
    else
      return nil
    end
  end

  def password=(word)
    @password = word
    self.password_digest = BCrypt::Password.create(word)
  end

  def password
    @password
  end

  def has_password?(word)
    BCrypt::Password.new(self.password_digest).is_password?(word)
  end


  def reset_session_token
    token = generate_session_token
    self.update(session_token: token)
    return token
  end


  def generate_session_token
    token = SecureRandom.base64(16)
    while User.all.pluck("session_token").include?(token)
      token = SecureRandom.base64(16)
    end

    return token
  end

  private

  def ensure_session_token
    self.session_token ||= self.generate_session_token
  end

end
