class MenuItem < ActiveRecord::Base

  belongs_to :menu

  VALID_PRICE_REGEX = /\A\d{0,2}.?\d{0,2}\z/
  validates :item, presence: true, length: { maximum: 50 }, 
                  uniqueness: true
  validates :price, presence: true, length: { maximum: 6 }, 
                    format: { with: VALID_PRICE_REGEX }
  validates :menu_id, presence: true
end
