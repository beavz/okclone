class User < ActiveRecord::Base
  validates :session_token, :password_digest, presence: true
  validates :username, :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  enum(
    gender: [ :gen_unans, :gen_man, :gen_woman, :gen_other ],
    orientation: [ :ori_unans, :ori_gay, :ori_straight, :ori_bi , :ori_ace ],
    ethnicity: [ :eth_unans, :eth_white, :eth_black, :eth_purple, :eth_latino_a, :eth_asian, :eth_other, :eth_mix ],
    body_type: [ :btp_unans, :btp_fat, :btp_thin, :btp_athletic, :btp_avg, :btp_really_fat ],
    diet: [ :eat_unans, :eat_bugs, :eat_vegi, :eat_vegan, :eat_paleo, :eat_kosher, :eat_omnivore ],
    smokes: [ :smo_unans, :smo_freq, :smo_occasionally, :smo_rarely, :smo_never ],
    drinks: [ :dri_unans, :dri_daily, :dri_frequently, :dri_socially, :dri_rarely, :dri_never],
    drugs: [ :dru_unans, :dru_yes, :dru_absolutely_not, :dru_previously, :dru_yes_but_only_pot ],
    religion: [ :rel_unans, :rel_no_thanks, :rel_atheist, :rel_christian, :rel_muslim, :rel_jewish, :rel_buddhist, :rel_hindu, :rel_other],
    sign: [ :sig_unans, :sig_aries, :sig_taurus, :sig_gemini, :sig_cancer, :sig_leo, :sig_virgo, :sig_libra, :sig_scorpio, :sig_sagittarius, :sig_capricorn, :sig_aquarius, :sig_pisces],
    education: [ :edu_unans, :edu_no_school, :edu_grade_school, :edu_some_high_school, :edu_high_school, :edu_assoc, :edu_ba, :edu_some_post_grad, :edu_ma, :edu_doc],
    job: [ :emp_unans, :emp_y, :emp_n],
    income: [ :inc_unans, :inc_some_money, :inc_no_money],
    relationship_status: [ :rstat_unans, :rstat_single, :rstat_available, :rstat_not_available],
    relationship_type: [ :rtyp_unans, :rtyp_strictly_mono, :rtyp_mostly_mono, :rtyp_strictly_non_mono, :rtyp_mostly_non_mono],
    offspring: [ :kids_unans, :kids_none_dnw, :kids_none_want, :kids_have_kids],
    pets: [ :pet_unans, :pet_none_dnw, :pet_none_want, :pet_have_cat, :pet_have_dog, :pet_have_other],
    looking_for_status: [ :lfs_unans, :lfs_only_single, :lfs_all_available, :lfs_any ]
  )

  after_initialize :ensure_session_token

  has_many :responses
  has_many :acceptable_responses
  has_many :albums
  has_many(
    :answered_questions,
    through: :responses,
    source: :question
  )
  has_one(
    :avatar,
    class_name: "Picture",
    foreign_key: :avatar_id,
    primary_key: :id
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
