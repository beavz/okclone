class Picture < ActiveRecord::Base
  attr_accessible :image
  has_attached_file :image, styles: { full: "700x700>", small: "100x100#" }

  belongs_to :album
  has_one(
    :user,
    through: :album,
    source: :user
  )


end
