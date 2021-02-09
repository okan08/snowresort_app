class Snowresort < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image

  with_options presence: true do
    validates :resort_name
    validates :introduction
    validates :image
    validates :details
  end

  def self.search(search)
    if search != ""
      Snowresort.where('resort_name LIKE(?)', "%#{search}%")
    else
      Snowresort.all
    end
  end

end
