class Sport < ApplicationRecord
  has_many :bookings, dependent: :destroy

  validates :location, :pincode, :price, :description, presence: true
  validates :name, presence: true, uniqueness: true
  validates :price, numericality: { greater_than: 0 }

  has_one_attached :image

  validate :image_presence_and_content_type

  def self.ransackable_attributes(_auth_object = nil)
    %w[name pincode]
  end

  def self.ransackable_associations(_auth_object = nil)
    []
  end


  private

  def image_presence_and_content_type
    if image.attached?
      if !image.content_type.in?(%w[image/jpeg image/png])
        errors.add(:image, 'must be a JPEG or PNG')
      end
    else
      errors.add(:image, 'must be attached')
    end
  end
end
