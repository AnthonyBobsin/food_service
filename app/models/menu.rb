class Menu < ActiveRecord::Base

  belongs_to :user
  has_many :menu_items, dependent: :destroy
  accepts_nested_attributes_for :menu_items, allow_destroy: true, reject_if: :all_blank

  validates :user_id, presence: true
  validates :description, length: { maximum: 140 }
end
