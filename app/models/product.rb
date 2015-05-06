class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews


  validates :title, presence: true
  validates :price, presence: true, format: {:with => /\A\d+\.?\d{0,2}\z/, message: "Only two decimal places."}
  validates :description, presence: true

  def average_rating
    if self.reviews.size > 0
        self.reviews.average(:rating)
    else
        'undefined'
    end
  end
end

