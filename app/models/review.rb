class Review < ApplicationRecord
  belongs_to :product
  validates :author, presence: true
  validates :content_body, presence: true
  validates :rating, presence: true
  validates_length_of :content_body, minimum: 50, maximum: 250
  validates_numericality_of :rating, greater_than: 0, less_than: 6
  before_save(:titleize_author)

  private

  def titleize_author
    self.author = self.author.titleize
  end
  
end