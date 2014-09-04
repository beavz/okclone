class Picture < ActiveRecord::Base

  has_attached_file :image, styles: { full: "700x700>", small: "100x100#" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :album
  has_one(
    :user,
    through: :album,
    source: :user
  )


end
